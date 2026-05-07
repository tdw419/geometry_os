; Synthetic GeOS Program
; initialization
LDI r27, 117
LDI r12, 521
LDI r0, 0x0000FF
; main loop
loop_0:
  LDI r21, 65280
  FILL r21
LINE r19, r5, r27, r8, r2
PSET r11, r28, r25
LINE r29, r28, r13, r0, r7
  FRAME
  JMP loop_0