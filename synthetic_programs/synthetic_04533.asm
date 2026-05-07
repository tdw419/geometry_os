; mixed program
; initialization
  LDI r18, 0x402A87
  LDI r12, 64
  LDI r8, 0x7D1818
  CALL func_0
func_0:
  AND r7, r15, r3
  ADD r15, r1, r11
  MOD r12, r2, r14
  MOD r1, r14, r16
  SHR r14, r5, r7
  MUL r12, r1, r14
  RET
  LDI r15, 0x7E033D
  LDI r4, 32
  LDI r9, 32
  PSETI
  CALL func_1
func_1:
  ADD r12, r23, r13
  DIV r7, r8, r4
  DIV r2, r7, r4
  SHR r15, r13, r12
  MOD r2, r6, r11
  DIV r10, r13, r4
  RET
  IKEY r11
  CMPI r11, 255
  JNZ r11, key_2
  IKEY r9
  CMPI r9, 37
  JNZ r9, key_3
  HALT
