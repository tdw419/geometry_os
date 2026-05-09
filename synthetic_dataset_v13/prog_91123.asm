; DESCRIPTION: Draws a blue rectangle at (251, 23) with width 96 and height 62.
; PLAN: r0=251(x), r1=23(y), r2=96(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 23
LDI r2, 96
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
