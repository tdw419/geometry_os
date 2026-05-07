; drawing loop program
; initialization
  LDI r10, 255
  LDI r24, 0x6D63A4
  LDI r11, 824
  LDI r12, 0xA371F2
  LDI r3, 32
  LDI r14, 0x611C9A
  LDI r0, 0xEF3D96
  LDI r1, 64
; palette
  LDI r26, 0x70D5
  LDI r4, 1
  LDI r5, 0x0044FF
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xFFEE00
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xDD0044
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xAAAAAA
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xFFFF00
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xDD0044
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x8800FF
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xAAFF00
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x44FF00
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x00FFFF
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xAAAAAA
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x00FF00
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x008888
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x0044FF
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0x000066
  STORE r26, r5
  ADD r26, r26, r4
  LDI r5, 0xFF0000
  STORE r26, r5
  ADD r26, r26, r4
main_0:
  ADDI r3, r0, 8
  SHLI r9, r17, 64
  SAR r14, r13, r26
  SHL r11, r14, r10
  SHLI r1, r3, 255
  IKEY r13
  CMPI r13, 159
  JNZ r13, key_1
  CMPI r9, 10
  CMPI r10, 255
  FRAME
  JMP main_0
