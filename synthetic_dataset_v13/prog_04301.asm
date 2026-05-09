; DESCRIPTION: Draws a purple rectangle at (86, 102) with width 47 and height 23.
; PLAN: r0=86(x), r1=102(y), r2=47(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 102
LDI r2, 47
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
