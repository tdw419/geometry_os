; drawing loop program
; initialization
  LDI r7, 0x7A7B43
  LDI r0, 0xFC990C
  LDI r11, 687
  LDI r9, 0x88E07A
  LDI r6, 128
  LDI r8, 0x6B4F24
; palette
  LDI r18, 0x2424
  LDI r14, 1
  LDI r7, 0x550077
  STORE r18, r7
  ADD r18, r18, r14
  LDI r7, 0xFF00FF
  STORE r18, r7
  ADD r18, r18, r14
  LDI r7, 0x000066
  STORE r18, r7
  ADD r18, r18, r14
  LDI r7, 0x0044FF
  STORE r18, r7
  ADD r18, r18, r14
  LDI r7, 0x00AAFF
  STORE r18, r7
  ADD r18, r18, r14
main_0:
  LDI r0, 0x17EDE4
  LDI r14, 2344
  LDI r4, 0x6C2866
  TEXT r0, r14, r4, "HELLO"
  LDI r2, 1302
  LDI r13, 170
  LDI r9, 32
  PSET r2, r13, r9
  MUL r6, r20, r5
  CMP r9, r2
  AND r5, r30, r14
  OR r2, r15, r0
  FRAME
  JMP main_0
