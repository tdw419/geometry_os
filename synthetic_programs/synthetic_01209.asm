; mixed program
; initialization
  LDI r4, 16
  LDI r15, 1093
  LDI r8, 0xB3C228
  LDI r7, 0x3484C4
  LDI r1, 2
; palette
  LDI r7, 0x2075
  LDI r4, 1
  LDI r10, 0x00AAFF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFFF00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x880088
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x0044FF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x008888
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x00AAFF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x00FF00
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x444444
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFFFFFF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x00FF44
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x0044FF
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x550077
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xFF8800
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0xDD0044
  STORE r7, r10
  ADD r7, r7, r4
  LDI r10, 0x44FF00
  STORE r7, r10
  ADD r7, r7, r4
  CMP r8, r19
  JZ r8, else_0
  MUL r4, r10, r5
  JMP endif_1
else_0:
  LDI r6, 2120
  LDI r5, 0x7CDAE5
  LDI r2, 1
  LDI r4, 2202
  LDI r0, 0xDA5769
  RECTF r6, r5, r2, r4, r0
  LDI r1, 0xD065B0
  LDI r8, 4
  LDI r6, 0x950AE1
  PSET r1, r8, r6
  LDI r0, 0xAD5E8F
  LDI r12, 3733
  LDI r13, 128
  LDI r7, 0x1E0424
  LDI r19, 16
  RECTF r0, r12, r13, r7, r19
  LDI r1, 10
  LDI r8, 8
  LDI r26, 957
  LDI r4, 1247
  LDI r6, 2
  RECTF r1, r8, r26, r4, r6
endif_1:
  CMPI r1, 144
  LDI r5, 0x32938E
  LDI r5, 880
  LDI r8, 0xE2F8F8
  PSETI
  LDI r13, 0
  LDI r12, 0x88AE3F
  LDI r3, 2146
  WPIXEL
  LDI r3, 3226
  LDI r3, 64
  LDI r13, 3811
  DRAWTEXT r3, r3, r13, "WORLD"
  CALL func_2
func_2:
  SHL r15, r14, r9
  SHR r13, r4, r15
  SHL r4, r15, r3
  SUB r0, r15, r19
  RET
  AND r11, r3, r12
  XOR r4, r3, r12
  OR r7, r3, r11
  HALT
