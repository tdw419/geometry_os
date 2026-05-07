; conditional logic
; initialization
  LDI r12, 0x5AF04C
  LDI r5, 3746
  LDI r6, 2056
  LDI r15, 807
  CMP r22, r13
  JNZ r22, else_0
  SUB r9, r11, r28
  OR r11, r4, r10
  OR r15, r6, r1
  MUL r12, r30, r2
  JMP endif_1
else_0:
  LDI r10, 0x96F7DC
  LDI r10, 3472
  LDI r2, 685
  LDI r6, 8
  LDI r1, 0xFA899B
  LINE r10, r10, r2, r6, r1
  LDI r6, 255
  LDI r0, 0x948B72
  LDI r10, 273
  LDI r5, 16
  LDI r5, 255
  RECTF r6, r0, r10, r5, r5
  LDI r15, 3562
  LDI r9, 8
  LDI r13, 4
  PSET r15, r9, r13
  LDI r6, 0x431D19
  LDI r15, 16
  LDI r3, 0x6A7DD9
  LDI r7, 255
  CIRCLE r6, r15, r3, r7
endif_1:
  HALT
