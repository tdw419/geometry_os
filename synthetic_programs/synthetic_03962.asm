; mixed program
; initialization
  LDI r6, 10
  LDI r12, 3383
  LDI r3, 0x712188
  CALL func_0
func_0:
  MUL r4, r1, r6
  DIV r8, r5, r4
  RET
  IKEY r5
  CMPI r5, 64
  JNZ r5, key_1
  CMP r4, r2
  JNZ r4, else_2
  AND r12, r7, r8
  MUL r7, r14, r8
  MOD r7, r13, r4
  JMP endif_3
else_2:
  LDI r14, 0xCB401E
  LDI r7, 1528
  LDI r1, 0
  LDI r0, 0xE96C0D
  CIRCLE r14, r7, r1, r0
endif_3:
  SHR r11, r14, r2
  SAR r9, r14, r13
  SHR r24, r0, r13
  CALL func_4
func_4:
  MOD r4, r5, r6
  SHR r19, r15, r3
  MUL r0, r13, r10
  RET
  HALT
