; mixed program
; initialization
  LDI r9, 8
  LDI r1, 2129
  LDI r7, 0x88D7F5
  LDI r2, 255
  LDI r15, 0x1C66FB
; palette
  LDI r15, 0x40EE
  LDI r12, 1
  LDI r3, 0xFF00FF
  STORE r15, r3
  ADD r15, r15, r12
  LDI r3, 0xFF0000
  STORE r15, r3
  ADD r15, r15, r12
  LDI r3, 0x550077
  STORE r15, r3
  ADD r15, r15, r12
  LDI r3, 0x00FF44
  STORE r15, r3
  ADD r15, r15, r12
  LDI r3, 0xAA00AA
  STORE r15, r3
  ADD r15, r15, r12
  LDI r3, 0x44FF00
  STORE r15, r3
  ADD r15, r15, r12
  LDI r5, 0x91B10F
  LDI r4, 1255
  LDI r14, 0xCA2DA2
  DRAWTEXT r5, r4, r14, "WORLD"
  LDI r15, 0xA8BDA0
  LDI r4, 128
  LDI r9, 16
  DRAWTEXT r15, r4, r9, "WORLD"
  CALL func_0
func_0:
  SHR r7, r8, r11
  ADD r13, r11, r12
  RET
  PUSH r25
  PUSH r15
  AND r14, r8, r0
  SHR r15, r5, r3
  POP r15
  POP r25
  CMPI r23, 0x795FA4
  HALT
