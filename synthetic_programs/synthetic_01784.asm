; conditional logic
; initialization
  LDI r14, 3350
  LDI r2, 2297
  CMP r2, r15
  JZ r2, else_0
  SHL r12, r11, r10
  SHL r10, r11, r13
  JMP endif_1
else_0:
  LDI r1, 64
  FILL r1
  LDI r4, 4
  LDI r9, 16
  LDI r10, 0xC89428
  PSET r4, r9, r10
  LDI r14, 64
  LDI r10, 128
  LDI r8, 1
  PSETI
endif_1:
  CMP r4, r2
  JZ r4, else_2
  OR r19, r14, r6
  AND r0, r6, r1
  SHR r8, r15, r0
  JMP endif_3
else_2:
  LDI r13, 0x18A9D8
  LDI r11, 0xBF800A
  LDI r14, 10
  PSETI
  LDI r12, 0x03F06F
  LDI r4, 4
  LDI r0, 0x9DA960
  WPIXEL
  LDI r10, 0
  FILL r10
  LDI r12, 32
  LDI r2, 2776
  LDI r9, 1375
  WPIXEL
endif_3:
  HALT
