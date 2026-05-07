; mixed program
; initialization
  LDI r27, 163
  LDI r0, 3119
  PUSH r7
  PUSH r6
  SHR r2, r10, r6
  SHL r12, r4, r14
  POP r6
  POP r7
  LDI r1, 0xF05038
  STORE r1, r14
  LOAD r11, r1
  LDI r12, 255
  STORE r12, r11
  LOAD r6, r12
  LDI r5, 3712
  STORE r5, r1
  LOAD r9, r5
  LDI r11, 3584
  STORE r11, r13
  LOAD r15, r11
  AND r11, r2, r22
  OR r12, r4, r6
  XOR r2, r3, r12
  OR r2, r0, r7
  IKEY r5
  CMPI r5, 56
  JNZ r5, key_0
  CMP r14, r3
  JZ r14, else_1
  SHR r12, r6, r9
  MUL r7, r5, r12
  OR r0, r1, r19
  ADD r5, r6, r7
  JMP endif_2
else_1:
  LDI r3, 0x80D0F1
  FILL r3
endif_2:
  PUSH r22
  SHR r1, r6, r7
  ADD r6, r7, r0
  POP r22
  LDI r5, 1
  LDI r6, 2880
  LDI r13, 128
  PSETI
  LDI r5, 32
  LDI r4, 681
  LDI r14, 10
  DRAWTEXT r5, r4, r14, "WORLD"
  HALT
