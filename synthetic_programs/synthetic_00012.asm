; conditional logic
; initialization
  LDI r14, 128
  LDI r3, 0x31803C
  LDI r10, 2
  LDI r12, 2
  CMP r15, r4
  JNZ r15, else_0
  SHL r10, r9, r15
  XOR r0, r3, r25
  JMP endif_1
else_0:
  LDI r7, 1396
  LDI r12, 0x7C0130
  LDI r3, 0xE1CFCE
  LDI r4, 64
  LDI r15, 510
  LINE r7, r12, r3, r4, r15
endif_1:
  CMP r6, r15
  JNZ r6, else_2
  MUL r10, r8, r6
  DIV r9, r6, r15
  SHL r8, r12, r4
  JMP endif_3
else_2:
  LDI r2, 8
  FILL r2
  LDI r6, 64
  LDI r4, 0x7A832D
  LDI r7, 16
  PSETI
  LDI r3, 64
  LDI r21, 3896
  LDI r6, 8
  PSET r3, r21, r6
endif_3:
  CMP r2, r7
  JNZ r2, else_4
  MUL r5, r1, r28
  JMP endif_5
else_4:
  LDI r9, 128
  LDI r10, 0xFCE216
  LDI r4, 4
  LDI r10, 0xEAF6D6
  LDI r5, 0xAC99F7
  RECTF r9, r10, r4, r10, r5
  LDI r6, 0xCF9C6F
  LDI r10, 0x30D651
  LDI r4, 55
  WPIXEL
  LDI r14, 2473
  LDI r0, 0xB81736
  LDI r1, 2
  PSET r14, r0, r1
  LDI r9, 2416
  LDI r7, 0x446320
  LDI r14, 3406
  LDI r15, 1789
  CIRCLE r9, r7, r14, r15
endif_5:
  HALT
