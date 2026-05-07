; drawing loop program
; initialization
  LDI r14, 3984
  LDI r4, 256
  LDI r8, 3546
  LDI r10, 4
  LDI r1, 128
  LDI r2, 1976
  LDI r13, 0x1EB162
; palette
  LDI r31, 0x60ED
  LDI r7, 1
  LDI r5, 0x0044FF
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0x00FFAA
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0xFFFF00
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0xDD0044
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0xDD0044
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0x888800
  STORE r31, r5
  ADD r31, r31, r7
  LDI r5, 0x550077
  STORE r31, r5
  ADD r31, r31, r7
main_0:
  SHL r12, r9, r4
  SHR r14, r15, r8
  LDI r10, 0x334722
  LDI r17, 0xF3FFB6
  LDI r3, 8
  LDI r15, 0x7ACC0B
  LDI r1, 3119
  LINE r10, r17, r3, r15, r1
  LDI r9, 2326
  LDI r3, 943
  LDI r12, 0x8E28F1
  TEXT r9, r3, r12, "HELLO"
  SHLI r8, r0, 1
  SAR r11, r2, r14
  SHR r7, r1, r0
  FRAME
  JMP main_0
