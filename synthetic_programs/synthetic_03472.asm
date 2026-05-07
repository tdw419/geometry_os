; mixed program
; initialization
  LDI r2, 1258
  LDI r6, 0x47CF88
  LDI r10, 2093
  LDI r1, 0x9D3E77
  LDI r14, 10
  LDI r13, 0x757127
  LDI r0, 2476
; palette
  LDI r3, 0x22FC
  LDI r13, 1
  LDI r20, 0xFF00FF
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x0044FF
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x0044FF
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0xFFFF00
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x000066
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x550077
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x00FF00
  STORE r3, r20
  ADD r3, r3, r13
  LDI r20, 0x000000
  STORE r3, r20
  ADD r3, r3, r13
  XOR r10, r12, r14
  XOR r17, r14, r7
  CMP r8, r7
  PUSH r13
  PUSH r4
  XOR r6, r3, r5
  SHR r22, r11, r14
  SHR r8, r1, r12
  POP r4
  POP r13
  CALL func_0
func_0:
  DIV r11, r3, r22
  AND r2, r16, r7
  XOR r15, r1, r3
  AND r7, r10, r20
  RET
  PUSH r9
  AND r8, r9, r15
  SUB r2, r7, r8
  OR r11, r13, r1
  XOR r3, r2, r8
  SHL r3, r25, r10
  POP r9
  IKEY r23
  CMPI r23, 250
  JNZ r23, key_1
  IKEY r4
  CMPI r4, 189
  JNZ r4, key_2
  HALT
