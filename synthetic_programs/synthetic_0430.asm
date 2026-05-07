; Synthetic GeOS Program
; initialization
LDI r29, 568
LDI r23, 425
LDI r24, 580
LDI r15, 343
LDI r11, 687
; main loop
loop_0:
  LDI r23, 16777215
  FILL r23
CIRCLE r7, r24, r28, r27
PSET r4, r11, r18
LINE r6, r7, r7, r28, r0
  FRAME
  JMP loop_0