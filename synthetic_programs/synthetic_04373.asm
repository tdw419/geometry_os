; mixed program
; initialization
  LDI r4, 0xD6F350
  LDI r15, 2155
  LDI r2, 0x38BF00
  LDI r3, 0xE76778
  LDI r6, 128
  LDI r7, 1
  LDI r29, 634
  CMP r30, r8
  CALL func_0
func_0:
  OR r14, r7, r0
  MUL r5, r12, r24
  SUB r15, r1, r9
  SHR r3, r4, r6
  OR r4, r9, r12
  RET
  LDI r5, 4016
  LDI r9, 1184
  LDI r4, 3475
  TEXT r5, r9, r4, "HELLO"
  ADD r14, r2, r11
  LDI r0, 2
  STORE r0, r8
  LOAD r1, r0
  LDI r10, 3129
  STORE r10, r14
  LOAD r9, r10
  LDI r26, 10
  STORE r26, r11
  LOAD r3, r26
  LDI r13, 2
  STORE r13, r7
  LOAD r5, r13
  LDI r8, 4
  STORE r8, r12
  LOAD r0, r8
  CMP r13, r0
  JNZ r13, else_1
  XOR r8, r14, r5
  JMP endif_2
else_1:
  LDI r10, 2
  LDI r10, 1243
  LDI r8, 0xEC7300
  LDI r1, 0x052471
  LDI r8, 256
  RECTF r10, r10, r8, r1, r8
  LDI r2, 0xD7F549
  LDI r0, 10
  LDI r13, 2
  PSETI
  LDI r12, 4
  LDI r1, 4
  LDI r4, 1760
  PSET r12, r1, r4
  LDI r4, 0x7E0C4B
  LDI r9, 0x1C4738
  LDI r11, 0x8C2065
  PSET r4, r9, r11
endif_2:
  IKEY r6
  CMPI r6, 16
  JNZ r6, key_3
  LDI r11, 0x50AA73
  LDI r10, 1349
  LDI r12, 32
  PSET r11, r10, r12
  HALT
