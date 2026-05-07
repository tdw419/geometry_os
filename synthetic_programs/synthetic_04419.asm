; mixed program
; initialization
  LDI r9, 972
  LDI r10, 0x70EFE4
  LDI r8, 1792
  LDI r2, 256
  LDI r7, 16
  LDI r3, 518
; palette
  LDI r1, 0x3028
  LDI r3, 1
  LDI r8, 0x00AAFF
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xFF0000
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xFF0000
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x880088
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x000066
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x000000
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x008888
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xDD0044
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xFF0000
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xAA00AA
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xFF4400
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x00FF44
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x0000CC
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0xFF8800
  STORE r1, r8
  ADD r1, r1, r3
  LDI r8, 0x8800FF
  STORE r1, r8
  ADD r1, r1, r3
  LDI r7, 0x775544
  LDI r14, 255
  LDI r9, 0xE10985
  WPIXEL
  IKEY r15
  CMPI r15, 4
  JNZ r15, key_0
  LDI r6, 3183
  LDI r15, 0x9D06AF
  LDI r1, 0x8A770A
  LDI r14, 255
  LDI r8, 3911
  RECTF r6, r15, r1, r14, r8
  MOD r12, r15, r1
  SAR r18, r0, r8
  SAR r14, r4, r15
  SHLI r5, r0, 1
  SHR r1, r7, r2
  CALL func_1
func_1:
  OR r12, r13, r3
  SUB r8, r2, r3
  SHR r2, r15, r14
  DIV r1, r4, r11
  MUL r2, r12, r6
  RET
  IKEY r3
  CMPI r3, 0x70BB79
  JNZ r3, key_2
  LDI r8, 0x5A2FC5
  STORE r8, r2
  LOAD r10, r8
  LDI r13, 3039
  STORE r13, r4
  LOAD r6, r13
  LDI r13, 2
  STORE r13, r3
  LOAD r7, r13
  LDI r4, 256
  STORE r4, r10
  LOAD r13, r4
  LDI r14, 1093
  STORE r14, r15
  LOAD r0, r14
  HALT
