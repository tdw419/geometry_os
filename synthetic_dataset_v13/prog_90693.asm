; DESCRIPTION: Draws a purple rectangle at (270, 73) with width 62 and height 102.
; PLAN: r0=270(x), r1=73(y), r2=62(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 73
LDI r2, 62
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
