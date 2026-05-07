; mixed program
; initialization
  LDI r11, 0x0EFB79
  LDI r6, 1580
  LDI r7, 256
  LDI r4, 0x298807
  LDI r2, 3459
  LDI r12, 1857
  LDI r0, 0x4D5A8F
  LDI r3, 793
; palette
  LDI r11, 0x50D6
  LDI r4, 1
  LDI r1, 0x888800
  STORE r11, r1
  ADD r11, r11, r4
  LDI r1, 0x444444
  STORE r11, r1
  ADD r11, r11, r4
  LDI r1, 0xAAFF00
  STORE r11, r1
  ADD r11, r11, r4
  LDI r1, 0x00AAFF
  STORE r11, r1
  ADD r11, r11, r4
  LDI r1, 0x8800FF
  STORE r11, r1
  ADD r11, r11, r4
  LDI r1, 0xFF4400
  STORE r11, r1
  ADD r11, r11, r4
  LDI r8, 2247
  STORE r8, r6
  LOAD r14, r8
  LDI r12, 256
  STORE r12, r7
  LOAD r4, r12
  LDI r2, 0xD6D94A
  LDI r10, 0xEE1201
  LDI r11, 255
  DRAWTEXT r2, r10, r11, "WORLD"
  CALL func_0
func_0:
  MUL r2, r10, r7
  ADD r1, r9, r23
  OR r6, r4, r2
  DIV r4, r3, r0
  RET
  OR r10, r2, r13
  HALT
