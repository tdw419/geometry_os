; Synthetic GeOS Program
; initialization
LDI r25, 533
LDI r26, 469
LDI r21, 270
; main loop
loop_0:
  LDI r18, 65535
  FILL r18
RECTF r12, r23, r30, r17, r12
LINE r7, r13, r6, r5, r6
LINE r27, r11, r6, r31, r20
  FRAME
  JMP loop_0