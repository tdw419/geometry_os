; mixed program
; initialization
  LDI r10, 2
  LDI r0, 0x432E0B
  LDI r9, 3189
  LDI r8, 128
  LDI r1, 0xC438B5
  LDI r12, 256
  CALL func_0
func_0:
  SHL r14, r7, r5
  ADD r22, r15, r0
  AND r1, r0, r17
  RET
  IKEY r7
  CMPI r7, 10
  JNZ r7, key_1
  LDI r0, 0
  STORE r0, r6
  LOAD r15, r0
  LDI r11, 1866
  STORE r11, r13
  LOAD r6, r11
  CMP r8, r13
  JNZ r8, else_2
  SUB r5, r8, r12
  JMP endif_3
else_2:
  LDI r9, 1371
  LDI r28, 0x0665A5
  LDI r9, 2950
  PSET r9, r28, r9
  LDI r7, 128
  FILL r7
  LDI r13, 3509
  LDI r1, 0x5C79DE
  LDI r15, 0x0DE4AC
  WPIXEL
  LDI r14, 1352
  LDI r11, 1
  LDI r12, 4
  LDI r1, 0x7F165E
  CIRCLE r14, r11, r12, r1
endif_3:
  DIV r12, r8, r3
  CALL func_4
func_4:
  XOR r14, r11, r13
  MUL r7, r2, r12
  DIV r4, r10, r5
  XOR r10, r14, r0
  MOD r2, r9, r3
  RET
  HALT
