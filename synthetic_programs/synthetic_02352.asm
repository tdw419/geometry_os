; conditional logic
; initialization
  LDI r0, 0xF66BCF
  LDI r14, 1290
  LDI r10, 2
  LDI r15, 32
  LDI r7, 2821
  LDI r4, 4
  CMP r6, r16
  JNZ r6, else_0
  AND r10, r15, r11
  AND r0, r11, r4
  JMP endif_1
else_0:
  LDI r7, 993
  LDI r7, 8
  LDI r14, 2
  PSET r7, r7, r14
  LDI r4, 1890
  LDI r1, 1775
  LDI r13, 0x1BA498
  LDI r2, 1566
  LDI r1, 0x346779
  RECTF r4, r1, r13, r2, r1
  LDI r3, 3254
  LDI r14, 3784
  LDI r5, 1587
  LDI r11, 0
  CIRCLE r3, r14, r5, r11
endif_1:
  HALT
