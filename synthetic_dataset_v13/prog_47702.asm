; DESCRIPTION: Draws a blue rectangle at (84, 98) with width 101 and height 117.
; PLAN: r0=84(x), r1=98(y), r2=101(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 98
LDI r2, 101
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
