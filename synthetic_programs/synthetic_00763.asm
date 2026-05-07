; mixed program
; initialization
  LDI r15, 1323
  LDI r0, 0xA8608E
; palette
  LDI r7, 0x213E
  LDI r4, 1
  LDI r10, 0xAAAAAA
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFFF00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x444444
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFF00FF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x00FF00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xAAAAAA
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFEE00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFFF00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFAA00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xAAAAAA
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x0000FF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x000000
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x880088
  STORE r7, r10
  ADD r7, r7, r4
  IKEY r3
  CMPI r3, 151
  JNZ r3, key_0
  CALL func_1
func_1:
  DIV r6, r1, r3
  DIV r12, r4, r10
  MUL r6, r14, r1
  MOD r6, r15, r9
  ADD r8, r7, r9
  RET
  XOR r9, r22, r2
  OR r11, r7, r5
  XOR r4, r1, r14
  SAR r13, r8, r5
  SAR r11, r3, r0
  SHLI r3, r10, 0
  SHLI r7, r3, 8
  LDI r9, 256
  STORE r9, r10
  LOAD r5, r9
  LDI r3, 0xEEAD74
  STORE r3, r10
  LOAD r1, r3
  LDI r14, 2
  STORE r14, r5
  LOAD r13, r14
  LDI r11, 0x0x21AF680x21AFA5
  STORE r11, r14
  LOAD r0, r11
  LDI r7, 142
  STORE r7, r15
  LOAD r12, r7
main_2:
  LDI r14, 3587
  LDI r12, 0xE656FA
  LDI r9, 0x1FBC7C
  WPIXEL
  ANDI r1, r9, 246
  LDI r9, 128
  LDI r1, 729
  LDI r3, 0x24BED4
  DRAWTEXT r9, r1, r3, "WORLD"
  FRAME
  JMP main_2
