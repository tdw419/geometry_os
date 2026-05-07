; drawing loop program
; initialization
  LDI r5, 0x8DC7F1
  LDI r4, 0xA3DEC8
  LDI r12, 0x1E11F6
  LDI r14, 32
; palette
  LDI r0, 0x211A
  LDI r9, 1
  LDI r10, 0xFF0000
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0xFFFF00
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x008888
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0xAAAAAA
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x8800FF
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x0044FF
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x00FF44
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0xFF0000
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x888800
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x550077
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x00AAFF
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x00AAFF
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x00FFAA
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0x008888
  STORE r0, r10
  ADD r0, r0, r9
  LDI r10, 0xFFFFFF
  STORE r0, r10
  ADD r0, r0, r9
main_0:
  SHR r12, r7, r5
  SHR r10, r3, r11
  SAR r3, r10, r4
  AND r13, r6, r0
  AND r9, r6, r14
  SHR r14, r6, r0
  SHR r0, r8, r7
  FRAME
  JMP main_0
