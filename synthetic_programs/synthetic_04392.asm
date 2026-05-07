; mixed program
; initialization
  LDI r9, 0x7C40BF
  LDI r14, 3531
  LDI r13, 8
  LDI r1, 0xC755A7
  LDI r8, 0xD3DC8A
  LDI r25, 2326
  LDI r18, 2
  CMP r6, r3
  CMP r7, r6
  JZ r7, else_0
  MUL r9, r12, r6
  DIV r6, r2, r14
  SHR r6, r11, r10
  JMP endif_1
else_0:
  LDI r2, 256
  LDI r6, 1683
  LDI r1, 3922
  LDI r8, 2314
  LDI r8, 64
  LINE r2, r6, r1, r8, r8
  LDI r11, 0x7693E4
  LDI r1, 3933
  LDI r7, 0xB3CC4A
  PSETI
  LDI r6, 1274
  FILL r6
endif_1:
  CMP r12, r11
  HALT
