; input driven program
; initialization
  LDI r11, 1664
  LDI r6, 1
  LDI r2, 16
  LDI r15, 1
  LDI r4, 1995
main_0:
  LDI r15, 255
  LDI r1, 2
  LDI r4, 0
  DRAWTEXT r15, r1, r4, "WORLD"
  SAR r15, r4, r9
  SHL r6, r12, r8
  SHL r14, r6, r7
  CMP r13, r21
  LDI r12, 155
  LDI r5, 3
  LDI r10, 0x3E555B
  PSETI
  FRAME
  JMP main_0
