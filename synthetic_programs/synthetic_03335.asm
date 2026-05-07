; mixed program
; initialization
  LDI r14, 0x41A2F9
  LDI r9, 255
  LDI r8, 0xEA1BD9
  LDI r22, 0xD348CA
  LDI r10, 1754
  LDI r13, 429
  LDI r18, 2446
  LDI r4, 0xBE6E27
  CALL func_0
func_0:
  SHL r11, r15, r5
  SHR r8, r10, r9
  RET
  LDI r5, 0x0EC8E9
  STORE r5, r10
  LOAD r4, r5
  LDI r8, 726
  STORE r8, r4
  LOAD r29, r8
  LDI r4, 0xF4B23E
  STORE r4, r8
  LOAD r30, r4
  LDI r14, 3600
  STORE r14, r3
  LOAD r13, r14
  LDI r7, 2774
  STORE r7, r1
  LOAD r0, r7
  PUSH r9
  PUSH r11
  SHR r19, r7, r9
  ADD r12, r2, r1
  XOR r0, r7, r4
  POP r11
  POP r9
  LDI r15, 24
loop_1:
  LDI r2, 0xD4E759
  LDI r14, 2322
  LDI r14, 1470
  LDI r0, 1
  LDI r12, 0
  RECTF r2, r14, r14, r0, r12
  LDI r6, 1777
  LDI r2, 0x98FA46
  LDI r14, 2
  PSET r6, r2, r14
  LDI r7, 64
  LDI r14, 4
  LDI r11, 3433
  LDI r10, 0xAD3B72
  CIRCLE r7, r14, r11, r10
  LDI r14, 1
  SUB r15, r15, r14
  JNZ r15, loop_1
  AND r9, r1, r4
  IKEY r14
  CMPI r14, 140
  JNZ r14, key_2
  LDI r14, 109
  LDI r13, 0x8BEAE7
  LDI r1, 32
  DRAWTEXT r14, r13, r1, "WORLD"
  HALT
