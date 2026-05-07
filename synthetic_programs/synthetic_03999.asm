; mixed program
; initialization
  LDI r0, 0x7EEDE2
  LDI r5, 4
  LDI r12, 256
  LDI r14, 32
  LDI r3, 128
  CALL func_0
func_0:
  MUL r8, r13, r7
  OR r14, r11, r6
  SUB r3, r0, r2
  SUB r8, r4, r6
  SUB r8, r10, r5
  ADD r7, r1, r6
  RET
  CMP r0, r13
  JNZ r0, else_1
  DIV r6, r12, r1
  XOR r5, r18, r1
  JMP endif_2
else_1:
  LDI r2, 2
  LDI r11, 1017
  LDI r14, 0x3AE0D6
  WPIXEL
  LDI r6, 16
  LDI r7, 0x0FC54A
  LDI r13, 0x14588E
  PSET r6, r7, r13
  LDI r11, 128
  LDI r2, 0x66C989
  LDI r21, 0xAB59AC
  LDI r10, 0x658C03
  LDI r26, 3511
  RECTF r11, r2, r21, r10, r26
endif_2:
  CMP r8, r14
  CMPI r13, 42
  CALL func_3
func_3:
  DIV r8, r7, r4
  XOR r12, r1, r2
  XOR r5, r14, r12
  SHR r12, r24, r7
  OR r15, r4, r10
  RET
  OR r11, r12, r1
  XOR r8, r3, r13
  LDI r7, 0x7E5CFA
  FILL r7
  HALT
