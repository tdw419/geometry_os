; mixed program
; initialization
  LDI r1, 0
  LDI r19, 3216
  LDI r15, 4
  LDI r7, 0xE4F7DD
  CALL func_0
func_0:
  MOD r2, r8, r3
  OR r4, r6, r25
  XOR r3, r4, r14
  DIV r13, r11, r12
  ADD r13, r17, r8
  MOD r8, r9, r12
  RET
  CALL func_1
func_1:
  AND r15, r3, r0
  MOD r4, r6, r11
  RET
  CMP r7, r1
  JZ r7, else_2
  MOD r7, r15, r4
  DIV r15, r11, r10
  JMP endif_3
else_2:
  LDI r2, 2647
  LDI r12, 0x3D6F2F
  LDI r1, 10
  LDI r10, 0xA65B26
  LDI r3, 3511
  LINE r2, r12, r1, r10, r3
endif_3:
  CMP r11, r12
  HALT
