; conditional logic
; initialization
  LDI r4, 128
  LDI r10, 0xF8677A
  LDI r11, 347
  CMP r10, r5
  JNZ r10, else_0
  MUL r7, r12, r14
  OR r11, r1, r5
  SHL r8, r1, r14
  DIV r2, r7, r13
  JMP endif_1
else_0:
  LDI r12, 429
  LDI r3, 0xE9C3A0
  LDI r5, 128
  PSETI
  LDI r13, 1914
  LDI r15, 655
  LDI r4, 4
  PSETI
  LDI r10, 2022
  FILL r10
  LDI r11, 0x38CD20
  LDI r4, 2
  LDI r13, 0xC4EFC0
  PSET r11, r4, r13
endif_1:
  CMP r1, r15
  JNZ r1, else_2
  SHR r5, r7, r12
  MOD r11, r4, r9
  JMP endif_3
else_2:
  LDI r10, 4
  LDI r3, 3250
  LDI r30, 1
  WPIXEL
endif_3:
  HALT
