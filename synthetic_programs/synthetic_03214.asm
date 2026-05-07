; drawing loop program
; initialization
  LDI r15, 294
  LDI r5, 2
  LDI r9, 0xC4EB33
  LDI r12, 0x90F461
  LDI r18, 3541
  LDI r0, 2180
main_0:
  XOR r15, r0, r4
  XOR r4, r12, r5
  AND r2, r0, r14
  XOR r11, r8, r13
  SHL r9, r5, r13
  LDI r6, 0x3DE068
  LDI r1, 0x04B92A
  LDI r9, 2219
  DRAWTEXT r6, r1, r9, "WORLD"
  LDI r5, 810
  LDI r1, 821
  LDI r2, 2
  LDI r2, 0xBF35D2
  CIRCLE r5, r1, r2, r2
  FRAME
  JMP main_0
