; drawing loop program
; initialization
  LDI r5, 0x836829
  LDI r10, 0x1BB3D7
  LDI r23, 2119
  LDI r6, 4
  LDI r4, 0x2A3078
  LDI r13, 0xEBEE93
  LDI r14, 2989
; palette
  LDI r14, 0x2461
  LDI r15, 1
  LDI r9, 0x00FF00
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x0044FF
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x550077
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0xAAAAAA
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x44FF00
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0xAA00AA
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x0044FF
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x008888
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x00FFAA
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x008888
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x44FF00
  STORE r14, r9
  ADD r14, r14, r15
main_0:
  LDI r0, 0x531C34
  LDI r2, 336
  LDI r8, 3575
  LDI r0, 2931
  LDI r0, 8
  RECTF r0, r2, r8, r0, r0
  ADDI r14, r6, 211
  LDI r4, 256
  LDI r10, 16
  LDI r0, 10
  DRAWTEXT r4, r10, r0, "WORLD"
  CMP r14, r6
  FRAME
  JMP main_0
