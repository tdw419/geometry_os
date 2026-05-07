; Synthetic GeOS Program
; initialization
LDI r28, 548
LDI r15, 466
LDI r7, 687
; main loop
loop_0:
  LDI r17, 16777215
  FILL r17
LINE r11, r23, r20, r3, r27
RECTF r26, r25, r14, r17, r9
PSET r23, r17, r20
  CMP r10, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0