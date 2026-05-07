; mixed program
; initialization
  LDI r0, 255
  LDI r9, 0xC777FB
  LDI r2, 64
  LDI r4, 1585
  LDI r13, 64
; palette
  LDI r8, 0x22B1
  LDI r3, 1
  LDI r6, 0xFFFFFF
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0xFFAA00
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0xDD0044
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x00FFAA
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x880088
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x00FF44
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x444444
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x00FFAA
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x880088
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x00AAFF
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x44FF00
  STORE r8, r6
  ADD r8, r8, r3
  LDI r6, 0x00FF00
  STORE r8, r6
  ADD r8, r8, r3
  LDI r15, 64
  LDI r14, 2833
  LDI r1, 4
  DRAWTEXT r15, r14, r1, "WORLD"
  IKEY r14
  CMPI r14, 191
  JNZ r14, key_0
  CALL func_1
func_1:
  AND r20, r13, r5
  ADD r2, r0, r15
  XOR r0, r5, r12
  SHR r4, r11, r10
  AND r13, r4, r9
  RET
  LDI r1, 8
  STORE r1, r6
  LOAD r12, r1
  LDI r4, 453
  STORE r4, r3
  LOAD r1, r4
  LDI r4, 0x95F0x4047DC
  STORE r4, r4
  LOAD r7, r4
main_2:
  LDI r8, 0x9A2FC3
  LDI r15, 4
  LDI r8, 0x02A3B5
  TEXT r8, r15, r8, "HELLO"
  XOR r1, r7, r8
  FRAME
  JMP main_2
