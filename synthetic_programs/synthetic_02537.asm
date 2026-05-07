; conditional logic
; initialization
  LDI r11, 3861
  LDI r2, 0x38BC41
  LDI r6, 0xF8477C
  LDI r0, 1
  LDI r12, 1797
  LDI r9, 0xFAA7F5
  CMP r7, r8
  JNZ r7, else_0
  AND r3, r5, r24
  MUL r0, r10, r2
  JMP endif_1
else_0:
  LDI r15, 10
  LDI r6, 1706
  LDI r1, 128
  LDI r7, 1854
  CIRCLE r15, r6, r1, r7
  LDI r10, 3407
  LDI r11, 0x2EE58D
  LDI r15, 10
  PSET r10, r11, r15
  LDI r0, 32
  LDI r15, 128
  LDI r9, 1490
  PSETI
endif_1:
  CMP r13, r6
  JZ r13, else_2
  ADD r11, r13, r6
  JMP endif_3
else_2:
  LDI r11, 0x333DBD
  LDI r14, 8
  LDI r1, 0
  PSETI
  LDI r6, 16
  LDI r4, 0x0ADE2D
  LDI r0, 1942
  LDI r3, 2509
  LDI r5, 8
  LINE r6, r4, r0, r3, r5
  LDI r11, 1463
  LDI r7, 3490
  LDI r0, 0x5C8EA1
  LDI r0, 285
  LDI r0, 525
  RECTF r11, r7, r0, r0, r0
endif_3:
  HALT
