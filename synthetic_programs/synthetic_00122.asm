; drawing loop program
; initialization
  LDI r11, 0x5482A1
  LDI r12, 32
  LDI r5, 10
  LDI r8, 128
  LDI r10, 0x2E3328
  LDI r14, 1975
  LDI r3, 32
main_0:
  LDI r6, 1524
  LDI r16, 128
  LDI r22, 825
  DRAWTEXT r6, r16, r22, "WORLD"
  XOR r9, r4, r5
  OR r7, r6, r9
  OR r15, r14, r12
  OR r0, r8, r15
  MUL r14, r5, r7
  FRAME
  JMP main_0
