; mixed program
; initialization
  LDI r3, 1873
  LDI r5, 32
  LDI r1, 0x9D5501
  LDI r19, 8
  LDI r13, 0x5C2AB4
  LDI r9, 0x74B347
  LDI r2, 1983
  LDI r4, 0x8EDF11
  CALL func_0
func_0:
  XOR r10, r18, r8
  MOD r25, r0, r9
  SHR r8, r7, r4
  RET
  IKEY r15
  CMPI r15, 244
  JNZ r15, key_1
  CMP r15, r8
  JNZ r15, else_2
  DIV r1, r8, r11
  SUB r14, r4, r13
  AND r12, r2, r6
  SHL r8, r6, r13
  JMP endif_3
else_2:
  LDI r0, 32
  LDI r3, 0xBFE195
  LDI r13, 256
  WPIXEL
  LDI r13, 2273
  LDI r15, 909
  LDI r11, 3834
  LDI r1, 0xBAFA24
  LDI r16, 8
  LINE r13, r15, r11, r1, r16
  LDI r1, 2627
  LDI r10, 0xC76508
  LDI r22, 2188
  PSET r1, r10, r22
  LDI r11, 255
  LDI r12, 3358
  LDI r10, 26
  PSETI
endif_3:
  PUSH r10
  PUSH r16
  PUSH r5
  AND r4, r10, r15
  ADD r8, r5, r13
  SHR r13, r0, r5
  AND r9, r5, r11
  ADD r15, r12, r13
  POP r5
  POP r16
  POP r10
  LDI r14, 0x7021
  STORE r14, r12
  LOAD r13, r14
  LDI r0x21C6, 1422
  STORE r0, r11
  LOAD r15, r0
  LDI r15, 0
  STORE r15, r9
  LOAD r0, r15
  CMP r9, r13
  CALL func_4
func_4:
  MOD r3, r2, r11
  XOR r3, r5, r9
  SHR r1, r3, r14
  RET
  CALL func_5
func_5:
  MOD r11, r3, r20
  ADD r7, r1, r28
  RET
  HALT
