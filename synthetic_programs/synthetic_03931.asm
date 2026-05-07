; counted animation
; initialization
  LDI r7, 1406
  LDI r9, 10
  LDI r1, 2
  LDI r2, 3731
  LDI r6, 0x07F062
  LDI r2, 0x0E748C
loop_0:
  LDI r10, 2152
  LDI r3, 8
  LDI r8, 3048
  WPIXEL
  ADDI r15, r2, 8
  ADDI r2, r4, 64
  ANDI r12, r14, 76
  LDI r1, 1
  SUB r2, r2, r1
  JNZ r2, loop_0
  LDI r9, 10
loop_1:
  DIV r12, r1, r15
  ADDI r1, r12, 210
  DIV r8, r10, r12
  ADDI r7, r19, 0x51189C
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_1
  LDI r2, 16
loop_2:
  CMPI r6, r9, 201
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_2
  HALT
