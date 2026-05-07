; mixed program
; initialization
  LDI r4, 10
  LDI r13, 3911
  LDI r8, 1490
  LDI r0, 0x65CED8
  LDI r9, 8
  LDI r11, 2697
  LDI r2, 0x1D15B3
; palette
  LDI r0, 0x24B8
  LDI r13, 1
  LDI r5, 0x0044FF
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x880088
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0xAAFF00
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0xFF0000
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x0044FF
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0xAAFF00
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x00FFFF
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x00AAFF
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x00FFFF
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x00FF00
  STORE r0, r5
  ADD r0, r0, r13
  LDI r5, 0x0044FF
  STORE r0, r5
  ADD r0, r0, r13
  CMP r8, r15
  JZ r8, else_0
  SUB r4, r13, r1
  XOR r10, r9, r6
  AND r13, r9, r4
  JMP endif_1
else_0:
  LDI r13, 8
  FILL r13
  LDI r9, 0x0DA21E
  LDI r2, 64
  LDI r12, 0x662CB8
  PSET r9, r2, r12
  LDI r4, 0x9CC0B6
  LDI r13, 16
  LDI r15, 3715
  LDI r14, 0x3BE301
  LDI r9, 0x3F7581
  RECTF r4, r13, r15, r14, r9
endif_1:
  SHL r0, r14, r22
  SAR r0, r14, r3
  LDI r4, 64
  STORE r4, r2
  LOAD r9, r4
  LDI r0, 2037
  STORE r0, r14
  LOAD r1, r0
  LDI r4, 256
  STORE r4, r1
  LOAD r12, r4
  LDI r15, 0x1C6295
  STORE r15, r8
  LOAD r1, r15
main_2:
  ADDI r11, r12, 104
  LDI r1, 4
  LDI r14, 128
  LDI r6, 2
  DRAWTEXT r1, r14, r6, "WORLD"
  IKEY r9
  CMPI r9, 26
  JNZ r9, key_3
  CMP r4, r6
  CMP r9, r7
  FRAME
  JMP main_2
