; conditional logic
; initialization
  LDI r14, 0
  LDI r10, 128
  LDI r4, 0x0CAB36
  LDI r7, 1757
  LDI r1, 0xB613BD
  CMP r8, r0
  JNZ r8, else_0
  AND r14, r15, r11
  OR r3, r4, r9
  JMP endif_1
else_0:
  LDI r15, 3737
  LDI r12, 342
  LDI r14, 658
  LDI r4, 0x5FACF0
  LDI r14, 0x637751
  LINE r15, r12, r14, r4, r14
  LDI r14, 64
  LDI r1, 4
  LDI r5, 16
  LDI r15, 3079
  CIRCLE r14, r1, r5, r15
  LDI r12, 3623
  LDI r7, 0x6DB7AC
  LDI r0, 1
  LDI r9, 2
  LDI r20, 0x80E536
  LINE r12, r7, r0, r9, r20
endif_1:
  CMP r4, r3
  JNZ r4, else_2
  SHL r10, r11, r13
  JMP endif_3
else_2:
  LDI r9, 2861
  LDI r6, 0x101B08
  LDI r1, 0x6C85B2
  PSET r9, r6, r1
endif_3:
  HALT
