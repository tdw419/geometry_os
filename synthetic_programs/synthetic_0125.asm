; Synthetic GeOS Program
; initialization
LDI r5, 0x888888
LDI r30, 743
LDI r13, 570
; main loop
loop_0:
  LDI r8, 0
  FILL r8
PSET r28, r17, r18
RECTF r13, r4, r22, r11, r2
  CMP r19, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0