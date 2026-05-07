; conditional logic
; initialization
  LDI r1, 128
  LDI r19, 256
  LDI r11, 10
  LDI r2, 1508
  LDI r9, 2195
  CMP r9, r15
  JNZ r9, else_0
  SHR r14, r0, r13
  JMP endif_1
else_0:
  LDI r5, 128
  LDI r0, 255
  LDI r2, 0x7C7A83
  PSET r5, r0, r2
  LDI r4, 2884
  LDI r0, 497
  LDI r13, 0xAB4D63
  PSETI
  LDI r3, 128
  LDI r5, 0x142DFF
  LDI r5, 2
  PSETI
endif_1:
  CMP r7, r5
  JNZ r7, else_2
  SHL r16, r0, r2
  SHR r8, r10, r0
  JMP endif_3
else_2:
  LDI r0, 0xE27414
  LDI r5, 442
  LDI r0, 128
  LDI r6, 128
  LDI r14, 1232
  LINE r0, r5, r0, r6, r14
endif_3:
  HALT
