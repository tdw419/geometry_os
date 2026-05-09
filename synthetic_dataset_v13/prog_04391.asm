; DESCRIPTION: Draws a blue rectangle at (356, 93) with width 104 and height 37.
; PLAN: r0=356(x), r1=93(y), r2=104(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 93
LDI r2, 104
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
