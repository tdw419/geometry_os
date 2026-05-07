; drawing loop program
; initialization
  LDI r11, 3729
  LDI r9, 4089
  LDI r13, 256
  LDI r1, 212
  LDI r28, 2
; palette
  LDI r21, 0x6086
  LDI r2, 1
  LDI r10, 0xFF8800
  STORE r21, r10
  ADD r21, r21, r2
  LDI r10, 0x0000CC
  STORE r21, r10
  ADD r21, r21, r2
  LDI r10, 0x8800FF
  STORE r21, r10
  ADD r21, r21, r2
  LDI r10, 0x00FFFF
  STORE r21, r10
  ADD r21, r21, r2
main_0:
  AND r9, r15, r4
  AND r8, r4, r13
  OR r18, r6, r2
  XOR r6, r2, r9
  CMPI r0, r3, 256
  LDI r10, 0x7A5642
  LDI r11, 128
  LDI r9, 1784
  LDI r10, 2778
  LDI r6, 2
  RECTF r10, r11, r9, r10, r6
  CMPI r12, 255
  CMPI r9, 8
  AND r1, r7, r8
  FRAME
  JMP main_0
