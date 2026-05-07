; mixed program
; initialization
  LDI r10, 0xAA3CC9
  LDI r1, 0xD3B043
  LDI r4, 256
  LDI r15, 162
  LDI r8, 649
  LDI r0, 0xC7F317
  LDI r12, 10
; palette
  LDI r10, 0x8017
  LDI r4, 1
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x00AAFF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x550077
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x00FFFF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x000066
  STORE r10, r0
  ADD r10, r10, r4
  CMP r3, r13
  JZ r3, else_0
  OR r1, r13, r9
  SUB r5, r29, r10
  MOD r30, r4, r7
  SHL r4, r10, r26
  JMP endif_1
else_0:
  LDI r8, 0x9C9340
  LDI r0, 0
  LDI r1, 787
  LDI r5, 2003
  LDI r7, 0x6B814F
  LINE r8, r0, r1, r5, r7
  LDI r6, 2097
  FILL r6
  LDI r13, 0xAFFF3E
  LDI r1, 0x521C3D
  LDI r9, 0xD48473
  LDI r11, 0x2C7DAB
  LDI r10, 392
  RECTF r13, r1, r9, r11, r10
endif_1:
  CALL func_2
func_2:
  MOD r26, r6, r0
  AND r14, r3, r13
  AND r1, r11, r3
  SUB r1, r8, r11
  RET
  CALL func_3
func_3:
  MOD r13, r14, r4
  OR r12, r7, r8
  SHL r12, r1, r8
  AND r7, r0, r9
  ADD r2, r6, r4
  MUL r14, r2, r15
  RET
  XOR r12, r7, r10
  OR r6, r15, r12
  LDI r2, 2
  LDI r15, 873
  LDI r11, 1647
  PSETI
  AND r12, r0, r13
  XOR r8, r13, r19
  XOR r2, r0, r31
  OR r0, r14, r15
  MOD r14, r1, r31
  HALT
