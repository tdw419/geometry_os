; Synthetic GeOS Program
; initialization
LDI r14, 0x00FFFF
LDI r9, 94
LDI r7, 574
LDI r28, 692
LDI r30, 498
LDI r6, 561
; main loop
loop_0:
  LDI r11, 0
  FILL r11
LINE r20, r9, r24, r15, r2
RECTF r9, r6, r27, r5, r3
  FRAME
  JMP loop_0