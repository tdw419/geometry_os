; conditional logic
; initialization
  LDI r8, 1318
  LDI r13, 0x426692
  LDI r4, 0xFB4D05
  LDI r12, 10
  LDI r15, 1003
  LDI r14, 2819
  LDI r9, 0x6568A2
  LDI r3, 0x3E64B1
  CMP r0, r2
  JZ r0, else_0
  SHL r11, r9, r18
  SUB r9, r0, r8
  SHR r4, r7, r2
  AND r9, r5, r4
  JMP endif_1
else_0:
  LDI r9, 500
  FILL r9
endif_1:
  CMP r5, r6
  JNZ r5, else_2
  AND r15, r11, r7
  SHR r3, r0, r16
  MOD r8, r5, r11
  JMP endif_3
else_2:
  LDI r9, 0xC67F81
  LDI r1, 2
  LDI r23, 2552
  LDI r6, 2208
  CIRCLE r9, r1, r23, r6
  LDI r14, 2
  LDI r13, 2323
  LDI r7, 2431
  LDI r10, 128
  LDI r7, 3345
  LINE r14, r13, r7, r10, r7
  LDI r14, 2752
  LDI r1, 1020
  LDI r14, 128
  LDI r0, 4
  CIRCLE r14, r1, r14, r0
endif_3:
  HALT
