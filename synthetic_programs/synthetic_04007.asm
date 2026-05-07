; drawing loop program
; initialization
  LDI r2, 16
  LDI r9, 0x8AB5EE
  LDI r10, 0x443F6A
  LDI r15, 0xF7F6A8
  LDI r22, 0xBA4930
  LDI r1, 1
; palette
  LDI r16, 0x2470
  LDI r3, 1
  LDI r4, 0xFFFFFF
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x00FFAA
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x008888
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x000066
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0xFFEE00
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x0000FF
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x0044FF
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x00AAFF
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0xFF0000
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x550077
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x00FF44
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x00FF44
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x0044FF
  STORE r16, r4
  ADD r16, r16, r3
  LDI r4, 0x0000FF
  STORE r16, r4
  ADD r16, r16, r3
main_0:
  LDI r1, 0
  LDI r10, 0
  LDI r11, 0xE770A3
  TEXT r1, r10, r11, "HELLO"
  CMPI r13, r9, 32
  LDI r13, 0x6550BE
  LDI r15, 0x3188F2
  LDI r13, 3988
  TEXT r13, r15, r13, "HELLO"
  SHR r6, r11, r7
  SHR r9, r14, r1
  SAR r10, r8, r12
  AND r10, r1, r2
  AND r13, r6, r15
  OR r0, r4, r15
  OR r8, r14, r1
  FRAME
  JMP main_0
