; conditional logic
; initialization
  LDI r5, 3250
  LDI r6, 0x008ACB
  LDI r10, 32
  LDI r14, 255
  CMP r11, r0
  JNZ r11, else_0
  ADD r15, r5, r2
  ADD r14, r28, r21
  MUL r8, r9, r1
  JMP endif_1
else_0:
  LDI r14, 8
  LDI r1, 0xBCFCB1
  LDI r12, 1957
  LDI r1, 1
  LDI r5, 0x5A59E7
  LINE r14, r1, r12, r1, r5
  LDI r9, 0x867FB1
  LDI r5, 32
  LDI r15, 0x0CEEC0
  LDI r5, 8
  CIRCLE r9, r5, r15, r5
  LDI r12, 0xAA4152
  LDI r8, 0xB4C3A6
  LDI r2, 0x7A04D5
  LDI r1, 255
  CIRCLE r12, r8, r2, r1
endif_1:
  HALT
