; DESCRIPTION: Draws a blue rectangle at (205, 156) with width 98 and height 35.
; PLAN: r0=205(x), r1=156(y), r2=98(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 156
LDI r2, 98
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
