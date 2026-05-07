; conditional logic
; initialization
  LDI r2, 3718
  LDI r1, 3589
  LDI r6, 219
  LDI r10, 3559
  LDI r5, 3141
  LDI r7, 2441
  LDI r13, 914
  LDI r25, 4
  CMP r14, r13
  JZ r14, else_0
  DIV r1, r23, r11
  SHR r9, r3, r13
  JMP endif_1
else_0:
  LDI r3, 0xC2F479
  FILL r3
  LDI r0, 3479
  LDI r5, 256
  LDI r2, 64
  WPIXEL
endif_1:
  HALT
