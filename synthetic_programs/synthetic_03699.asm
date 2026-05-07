; mixed program
; initialization
  LDI r3, 1891
  LDI r4, 1
  LDI r8, 0x7DF866
  LDI r0, 2038
  LDI r7, 3654
  LDI r1, 10
  LDI r11, 3755
  AND r3, r5, r11
  AND r3, r9, r10
  AND r2, r14, r6
  CALL func_0
func_0:
  SUB r1, r14, r4
  XOR r28, r14, r13
  MUL r15, r14, r2
  MUL r4, r11, r0
  RET
  SAR r13, r0, r10
  SHL r15, r6, r12
  SHL r12, r4, r10
  SHR r13, r4, r3
  SHLI r7, r8, 1
  SHL r10, r8, r12
  CALL func_1
func_1:
  SUB r12, r0, r6
  AND r15, r10, r14
  MOD r7, r12, r11
  DIV r15, r5, r11
  SHR r2, r15, r13
  RET
  CMP r26, r3
  JZ r26, else_2
  XOR r0, r8, r5
  JMP endif_3
else_2:
  LDI r5, 708
  LDI r13, 256
  LDI r9, 0
  PSETI
  LDI r6, 0
  LDI r4, 0x392D0D
  LDI r5, 317
  PSETI
  LDI r0, 1
  LDI r4, 64
  LDI r7, 2306
  LDI r14, 64
  LDI r0, 2430
  RECTF r0, r4, r7, r14, r0
endif_3:
  HALT
