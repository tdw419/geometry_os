; DESCRIPTION: Draws a blue rectangle at (57, 81) with width 119 and height 98.
; PLAN: r0=57(x), r1=81(y), r2=119(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 81
LDI r2, 119
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
