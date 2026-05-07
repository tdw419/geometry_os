; mixed program
; initialization
  LDI r21, 32
  LDI r11, 8
  LDI r10, 0x1652AF
  LDI r1, 925
  LDI r12, 256
  LDI r3, 0x641CC5
; palette
  LDI r10, 0x21B2
  LDI r28, 1
  LDI r8, 0xFFFFFF
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xDD0044
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xAAFF00
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xFFEE00
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0x8800FF
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xAA00AA
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xAA00AA
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0xAA00AA
  STORE r10, r8
  ADD r10, r10, r28
  LDI r8, 0x0044FF
  STORE r10, r8
  ADD r10, r10, r28
  CMP r0, r1
  JZ r0, else_0
  SHR r1, r5, r8
  JMP endif_1
else_0:
  LDI r26, 64
  LDI r15, 1351
  LDI r6, 32
  LDI r9, 0x59A30B
  LDI r8, 0x07D405
  RECTF r26, r15, r6, r9, r8
  LDI r11, 16
  LDI r0, 256
  LDI r2, 1826
  LDI r2, 0xC4B51E
  LDI r31, 0xD7B018
  LINE r11, r0, r2, r2, r31
  LDI r0, 8
  LDI r9, 0
  LDI r16, 16
  PSET r0, r9, r16
endif_1:
  XOR r11, r4, r14
  XOR r2, r6, r4
  OR r8, r15, r9
  AND r5, r15, r3
  OR r12, r9, r5
  LDI r0, 2225
  LDI r7, 531
  LDI r10, 2528
  DRAWTEXT r0, r7, r10, "WORLD"
  HALT
