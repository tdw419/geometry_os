; mixed program
; initialization
  LDI r5, 0xBE1203
  LDI r12, 10
  LDI r0, 8
  LDI r10, 4
  LDI r9, 1142
  LDI r11, 32
  LDI r10, 3581
  LDI r6, 8
  PSETI
  LDI r5, 256
  STORE r5, r14
  LOAD r4, r5
  LDI r6, 1
  STORE r6, r1
  LOAD r15, r6
  LDI r13, 0x27450F
  STORE r13, r21
  LOAD r12, r13
  LDI r4, 0xCED19D
  STORE r4, r29
  LOAD r12, r4
  ADD r6, r15, r7
  CALL func_0
func_0:
  SUB r3, r9, r6
  XOR r11, r5, r14
  SUB r8, r11, r1
  AND r14, r10, r1
  ADD r7, r10, r2
  RET
  LDI r10, 0x242283
  STORE r10, r2
  LOAD r3, r10
  LDI r14, 2179
  STORE r14, r14
  LOAD r13, r14
  CMP r4, r12
  JZ r4, else_1
  XOR r12, r2, r8
  SHR r15, r6, r4
  JMP endif_2
else_1:
  LDI r15, 0xCC929F
  LDI r9, 0xCD65D0
  LDI r21, 643
  PSETI
  LDI r11, 0x5A161E
  LDI r5, 8
  LDI r4, 32
  LDI r10, 0x9246AB
  CIRCLE r11, r5, r4, r10
endif_2:
  HALT
