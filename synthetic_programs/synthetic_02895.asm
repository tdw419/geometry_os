; drawing loop program
; initialization
  LDI r11, 0x392886
  LDI r6, 0xFAAC34
  LDI r10, 0x1D8162
  LDI r12, 473
  LDI r9, 0x5B4173
  LDI r2, 0xC16ECD
  LDI r14, 899
; palette
  LDI r12, 0x401D
  LDI r13, 1
  LDI r10, 0x8800FF
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xAAAAAA
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x00AAFF
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xDD0044
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x444444
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xFF8800
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xFF8800
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xDD0044
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xFF0000
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x00FFAA
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x8800FF
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x550077
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xFF0000
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0xAAAAAA
  STORE r12, r10
  ADD r12, r12, r13
  LDI r10, 0x00FFAA
  STORE r12, r10
  ADD r12, r12, r13
main_0:
  AND r12, r19, r6
  XOR r2, r15, r5
  XOR r7, r3, r10
  XOR r2, r13, r11
  XOR r1, r14, r11
  SHLI r7, r12, 6
  SHR r7, r3, r5
  SHL r25, r0, r12
  SHR r1, r0, r4
  FRAME
  JMP main_0
