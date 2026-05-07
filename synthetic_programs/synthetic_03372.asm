; mixed program
; initialization
  LDI r9, 3640
  LDI r11, 0xF0AE41
  LDI r1, 3424
  LDI r4, 2780
  LDI r12, 32
  LDI r0, 2
  LDI r5, 43
  LDI r10, 16
  PUSH r2
  MOD r15, r3, r13
  XOR r5, r1, r2
  POP r2
  SHR r10, r8, r11
  SHL r0, r6, r3
  SHL r6, r26, r15
  SHLI r1, r5, 0x9EFD0A
  SHL r14, r0, r2
  SHR r14, r5, r23
  SAR r1, r14, r9
  DIV r8, r9, r2
  IKEY r15
  CMPI r15, 0x0C6339
  JNZ r15, key_0
  HALT
