; mixed program
; initialization
  LDI r0, 128
  LDI r6, 8
  LDI r15, 0x1F90FF
  LDI r13, 479
  LDI r3, 0x8D94F9
  LDI r3, 64
  LDI r1, 4
  LDI r5, 32
  TEXT r3, r1, r5, "HELLO"
  LDI r14, 3493
  LDI r11, 256
  LDI r4, 3564
  PSET r14, r11, r4
  SHL r3, r7, r14
  SHR r4, r5, r11
  SAR r10, r3, r0
  MOD r14, r13, r5
  CALL func_0
func_0:
  MOD r27, r7, r1
  SUB r9, r23, r1
  MOD r11, r9, r30
  SHR r15, r12, r1
  SHR r0, r13, r5
  DIV r5, r11, r3
  RET
  HALT
