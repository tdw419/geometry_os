; conditional logic
; initialization
  LDI r0, 796
  LDI r2, 0x2ECC40
  LDI r5, 376
  LDI r4, 2664
  LDI r18, 3514
  LDI r25, 0
  LDI r11, 3538
  CMP r13, r9
  JZ r13, else_0
  ADD r3, r15, r9
  DIV r13, r30, r15
  JMP endif_1
else_0:
  LDI r6, 32
  LDI r3, 0x5F3C82
  LDI r4, 3298
  LDI r9, 0x2F4BF9
  LDI r14, 3049
  LINE r6, r3, r4, r9, r14
  LDI r0, 1818
  LDI r14, 256
  LDI r13, 9
  LDI r2, 2474
  CIRCLE r0, r14, r13, r2
endif_1:
  HALT
