; counted animation
; initialization
  LDI r9, 0xF2AFD9
  LDI r2, 1341
  LDI r1, 255
  LDI r5, 2
  LDI r7, 917
  LDI r12, 0xBCB6E5
loop_0:
  SHL r8, r0, r13
  ADDI r7, r21, 198
  ADD r9, r1, r13
  SUB r12, r11, r14
  LDI r31, 1
  SUB r12, r12, r31
  JNZ r12, loop_0
  LDI r7, 16
loop_1:
  CMPI r14, r3, 175
  XOR r12, r5, r2
  LDI r12, 32
  LDI r4, 3609
  LDI r5, 0x7C05D5
  LDI r7, 10
  LDI r14, 0x405317
  RECTF r12, r4, r5, r7, r14
  SHR r8, r15, r3
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_1
  HALT
