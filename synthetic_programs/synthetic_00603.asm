; mixed program
; initialization
  LDI r14, 2688
  LDI r12, 8
  LDI r10, 1
  LDI r0, 2779
; palette
  LDI r13, 0x22AA
  LDI r15, 1
  LDI r7, 0xFFFFFF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x880088
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0xFFEE00
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x000000
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x0044FF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x00FFAA
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0xFFAA00
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x00FF00
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x0000CC
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x0044FF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0xFFFFFF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x44FF00
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x00FF44
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x00AAFF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x8800FF
  STORE r13, r7
  ADD r13, r13, r15
  LDI r7, 0x550077
  STORE r13, r7
  ADD r13, r13, r15
  CMPI r15, 4
  CMP r15, r8
  LDI r8, 0x8919B3
  LDI r10, 909
  LDI r9, 255
  PSETI
  SHR r11, r8, r7
  SAR r15, r14, r0
  SHLI r11, r12, 0x14CDD0
  SHL r9, r10, r15
  OR r15, r4, r8
  XOR r2, r9, r11
main_0:
  CMP r1, r13
  XOR r1, r14, r2
  OR r5, r14, r6
  AND r27, r13, r9
  AND r13, r1, r15
  AND r6, r3, r4
  SUB r1, r7, r4
  LDI r15, 0x8B6E1C
  LDI r8, 0x0F55CC
  LDI r2, 1443
  LDI r9, 255
  CIRCLE r15, r8, r2, r9
  FRAME
  JMP main_0
