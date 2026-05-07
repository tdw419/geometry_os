; mixed program
; initialization
  LDI r14, 32
  LDI r3, 1258
  LDI r0, 1067
; palette
  LDI r13, 0x22FA
  LDI r14, 1
  LDI r5, 0x000000
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x0044FF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x0044FF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0xFF00FF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x44FF00
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0xFFFFFF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0xFFFFFF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x0044FF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x550077
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x0000CC
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x8800FF
  STORE r13, r5
  ADD r13, r13, r14
  LDI r5, 0x44FF00
  STORE r13, r5
  ADD r13, r13, r14
  CMP r12, r14
  JNZ r12, else_0
  MUL r1, r13, r9
  XOR r1, r15, r13
  MOD r10, r8, r13
  SHL r3, r14, r6
  JMP endif_1
else_0:
  LDI r6, 32
  LDI r4, 3837
  LDI r13, 256
  LDI r9, 0x9C388F
  LDI r9, 2807
  RECTF r6, r4, r13, r9, r9
  LDI r1, 0x0F651D
  LDI r4, 1914
  LDI r10, 2407
  PSETI
  LDI r6, 1761
  LDI r7, 2004
  LDI r12, 1085
  PSET r6, r7, r12
endif_1:
  LDI r13, 3019
  LDI r4, 1811
  LDI r0, 0x772C5D
  DRAWTEXT r13, r4, r0, "WORLD"
  OR r2, r14, r0
  AND r2, r3, r4
  AND r7, r5, r3
  OR r12, r2, r14
  IKEY r11
  CMPI r11, 70
  JNZ r11, key_2
  LDI r2, 0x2F5933
  LDI r8, 0x07BF2F
  LDI r14, 0
  WPIXEL
  IKEY r12
  CMPI r12, 255
  JNZ r12, key_3
  HALT
