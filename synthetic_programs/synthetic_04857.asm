; mixed program
; initialization
  LDI r10, 0x6B9CC6
  LDI r15, 1
  LDI r9, 0xD0DF52
  LDI r0, 0xDB054B
  LDI r5, 2521
  LDI r11, 256
  LDI r13, 4
; palette
  LDI r1, 0x2196
  LDI r10, 1
  LDI r9, 0xFFFFFF
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x0000FF
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x44FF00
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x00FFFF
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x008888
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x444444
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0xFF4400
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0xFFFFFF
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0xFF8800
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x008888
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x00FF00
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x550077
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0xFFFF00
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x550077
  STORE r1, r9
  ADD r1, r1, r10
  LDI r9, 0x00FF44
  STORE r1, r9
  ADD r1, r1, r10
  XOR r0, r9, r6
  OR r0, r11, r7
  CALL func_0
func_0:
  DIV r9, r12, r15
  OR r12, r7, r29
  SHL r15, r5, r4
  DIV r7, r2, r15
  SHL r1, r12, r18
  RET
  SHL r13, r8, r5
  SHR r13, r6, r12
  SHL r4, r8, r10
  AND r14, r3, r10
  XOR r3, r2, r7
  OR r1, r12, r5
  LDI r11, 1139
  LDI r10, 0xA20FF6
  LDI r8, 0x3257B1
  DRAWTEXT r11, r10, r8, "WORLD"
main_1:
  DIV r4, r23, r8
  LDI r12, 0x6F18EB
  LDI r7, 256
  LDI r3, 2
  LDI r3, 1
  CIRCLE r12, r7, r3, r3
  ADD r27, r13, r8
  FRAME
  JMP main_1
