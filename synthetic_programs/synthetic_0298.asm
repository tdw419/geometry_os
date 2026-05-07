; Synthetic GeOS Program
; initialization
LDI r2, 453
LDI r5, 461
LDI r18, 189
LDI r29, 745
LDI r9, 194
; main loop
loop_0:
  LDI r2, 16777215
  FILL r2
RECTF r25, r14, r0, r30, r18
LINE r30, r11, r10, r26, r16
LINE r18, r11, r2, r14, r18
  CMP r8, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0