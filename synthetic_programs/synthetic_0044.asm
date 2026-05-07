; Synthetic GeOS Program
; initialization
LDI r16, 597
LDI r29, 542
LDI r17, 1013
LDI r14, 559
; main loop
loop_0:
  LDI r7, 16711680
  FILL r7
PSET r25, r21, r7
RECTF r24, r14, r15, r17, r13
  CMP r27, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0