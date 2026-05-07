; input driven program
; initialization
  LDI r1, 3636
  LDI r3, 4
  LDI r4, 1187
  LDI r13, 1751
  LDI r5, 3470
  LDI r11, 10
  LDI r7, 2
  LDI r14, 0x0370EA
main_0:
  LDI r4, 10
  LDI r10, 0
  LDI r13, 256
  DRAWTEXT r4, r10, r13, "WORLD"
  ADDI r2, r8, 16
  ADDI r5, r1, 0x667F46
  SUBI r4, r14, 0
  SHR r0, r31, r10
  SHL r8, r10, r3
  SAR r0, r8, r4
  XOR r0, r2, r22
  OR r11, r5, r12
  FRAME
  JMP main_0
