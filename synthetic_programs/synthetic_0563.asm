; Synthetic GeOS Program
; initialization
LDI r16, 695
LDI r20, 495
LDI r11, 0xFFFF00
LDI r11, 37
; main loop
loop_0:
  LDI r5, 65280
  FILL r5
PSET r2, r4, r7
LINE r28, r3, r25, r4, r13
CIRCLE r21, r15, r11, r31
  CMP r9, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0