; drawing loop program
; initialization
  LDI r10, 2240
  LDI r7, 32
  LDI r27, 0x20E839
; palette
  LDI r3, 0x2329
  LDI r6, 1
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x000066
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x000000
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0xFF4400
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x00AAFF
  STORE r3, r8
  ADD r3, r3, r6
  LDI r8, 0x550077
  STORE r3, r8
  ADD r3, r3, r6
main_0:
  SHL r5, r7, r9
  SAR r1, r11, r4
  LDI r8, 64
  LDI r15, 2195
  LDI r3, 4076
  TEXT r8, r15, r3, "HELLO"
  XOR r22, r9, r15
  XOR r14, r27, r3
  AND r10, r3, r7
  FRAME
  JMP main_0
