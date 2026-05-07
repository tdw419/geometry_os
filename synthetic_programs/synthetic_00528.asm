; input driven program
; initialization
  LDI r4, 10
  LDI r10, 0x657D9D
main_0:
  LDI r0, 329
  LDI r5, 16
  LDI r11, 1421
  DRAWTEXT r0, r5, r11, "WORLD"
  SAR r15, r6, r8
  SHL r7, r4, r8
  FRAME
  JMP main_0
