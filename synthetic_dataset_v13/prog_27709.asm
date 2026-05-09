; DESCRIPTION: Draws a purple rectangle at (127, 100) with width 37 and height 31.
; PLAN: r0=127(x), r1=100(y), r2=37(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 100
LDI r2, 37
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
