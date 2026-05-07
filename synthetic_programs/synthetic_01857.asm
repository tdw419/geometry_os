; counted animation
; initialization
  LDI r12, 0xA00B8B
  LDI r8, 2432
  LDI r13, 0x785079
  LDI r5, 16
  LDI r5, 1
loop_0:
  ADDI r10, r5, 64
  SHR r10, r15, r12
  LDI r6, 3608
  LDI r15, 3236
  LDI r27, 2
  WPIXEL
  CMPI r11, r15, 16
  LDI r12, 1
  SUB r5, r5, r12
  JNZ r5, loop_0
  LDI r6, 255
loop_1:
  CMPI r5, r8, 0xDE715E
  XOR r0, r11, r8
  LDI r7, 1
  SUB r6, r6, r7
  JNZ r6, loop_1
  HALT
