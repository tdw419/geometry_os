; drawing loop program
; initialization
  LDI r13, 3524
  LDI r7, 0xF516D7
  LDI r6, 0x21A371
; palette
  LDI r10, 0x709A
  LDI r15, 1
  LDI r12, 0xFF0000
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xFF8800
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xFFFF00
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x0044FF
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xAAAAAA
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x444444
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xFF4400
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xDD0044
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x000066
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x00AAFF
  STORE r10, r12
  ADD r10, r10, r15
main_0:
  LDI r15, 8
  LDI r9, 0x055479
  LDI r1, 0x0BCEC1
  DRAWTEXT r15, r9, r1, "WORLD"
  OR r4, r11, r0
  OR r6, r10, r5
  AND r9, r2, r7
  XOR r3, r11, r9
  AND r15, r4, r7
  AND r18, r11, r2
  OR r2, r12, r13
  AND r3, r13, r14
  XOR r5, r14, r9
  OR r1, r9, r14
  FRAME
  JMP main_0
