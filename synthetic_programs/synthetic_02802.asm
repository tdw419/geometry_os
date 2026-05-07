; drawing loop program
; initialization
  LDI r26, 3405
  LDI r6, 2
  LDI r8, 0x0F4687
; palette
  LDI r15, 0x217A
  LDI r0, 1
  LDI r14, 0xFFEE00
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0xAAAAAA
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x00AAFF
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x000066
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x000066
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0xFF0000
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0xFFFFFF
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x0000FF
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x00FF44
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0xFF00FF
  STORE r15, r14
  ADD r15, r15, r0
  LDI r14, 0x00FF44
  STORE r15, r14
  ADD r15, r15, r0
main_0:
  CMP r4, r9
  CMPI r14, r15, 0x3AE5B4
  AND r8, r14, r13
  SHR r13, r14, r10
  LDI r2, 693
  LDI r15, 2406
  LDI r2, 256
  LDI r0, 0xDC48A5
  LDI r9, 0
  RECTF r2, r15, r2, r0, r9
  FRAME
  JMP main_0
