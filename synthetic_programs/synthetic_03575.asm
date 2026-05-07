; input driven program
; initialization
  LDI r16, 0x0902C7
  LDI r7, 8
  LDI r28, 256
  LDI r12, 0x296335
  LDI r10, 461
  LDI r4, 3273
  LDI r15, 10
main_0:
  CMPI r20, r9, 24
  SUBI r8, r15, 201
  CMP r8, r14
  LDI r22, 3779
  LDI r6, 324
  LDI r11, 989
  DRAWTEXT r22, r6, r11, "WORLD"
  FRAME
  JMP main_0
