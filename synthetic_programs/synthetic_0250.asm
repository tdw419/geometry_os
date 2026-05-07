; Synthetic GeOS Program
; initialization
LDI r5, 588
LDI r26, 950
LDI r14, 30
LDI r12, 391
LDI r15, 0xFFFF00
LDI r7, 941
; main loop
loop_0:
  LDI r31, 16777215
  FILL r31
PSET r15, r2, r26
LINE r9, r10, r31, r14, r15
RECTF r24, r9, r11, r13, r0
  FRAME
  JMP loop_0