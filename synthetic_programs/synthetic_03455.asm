; mixed program
; initialization
  LDI r10, 0x41FBAD
  LDI r0, 0x1EE69F
  LDI r6, 32
  LDI r5, 218
; palette
  LDI r13, 0x601C
  LDI r4, 1
  LDI r12, 0x00FF00
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x0044FF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x880088
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xFF0000
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x880088
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xFFFF00
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xAAAAAA
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xFFFFFF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x00FFFF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x0044FF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xDD0044
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x00FF44
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0xAA00AA
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x8800FF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x0044FF
  STORE r13, r12
  ADD r13, r13, r4
  LDI r12, 0x8800FF
  STORE r13, r12
  ADD r13, r13, r4
  SHLI r28, r14, 2
  SHL r5, r7, r8
  SAR r2, r6, r9
  SHLI r12, r3, 7
  SHR r10, r12, r1
  IKEY r10
  CMPI r10, 87
  JNZ r10, key_0
  CMP r15, r5
  JNZ r15, else_1
  OR r7, r1, r4
  JMP endif_2
else_1:
  LDI r11, 0x7E140A
  LDI r8, 256
  LDI r9, 256
  PSETI
  LDI r10, 654
  LDI r7, 0x94A94F
  LDI r15, 1902
  LDI r10, 4
  LDI r3, 2
  RECTF r10, r7, r15, r10, r3
  LDI r3, 3618
  LDI r4, 1315
  LDI r5, 4
  PSET r3, r4, r5
  LDI r4, 0xC3EE48
  FILL r4
endif_2:
  SAR r0, r6, r14
  SAR r15, r3, r11
  SAR r2, r4, r12
  SHR r14, r1, r15
main_3:
  CMPI r2, 180
  LDI r9, 143
  LDI r2, 0x059B1C
  LDI r13, 0x308DEC
  TEXT r9, r2, r13, "HELLO"
  LDI r15, 680
  LDI r6, 0x641CBD
  LDI r7, 4
  TEXT r15, r6, r7, "HELLO"
  SHLI r0, r15, 64
  SHL r11, r8, r5
  SHR r7, r1, r12
  IKEY r15
  CMPI r15, 0x64BA0B
  JNZ r15, key_4
  LDI r8, 0xB562D3
  LDI r7, 545
  LDI r7, 0x5EB91D
  TEXT r8, r7, r7, "HELLO"
  FRAME
  JMP main_3
