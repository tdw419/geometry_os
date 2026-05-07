; Synthetic GeOS Program
; initialization
LDI r8, 626
LDI r30, 336
LDI r11, 20
LDI r30, 481
LDI r8, 583
LDI r27, 775
; main loop
loop_0:
  LDI r3, 65535
  FILL r3
PSET r26, r2, r11
PSET r18, r8, r25
RECTF r19, r0, r24, r0, r19
  FRAME
  JMP loop_0