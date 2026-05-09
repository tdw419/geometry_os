; DESCRIPTION: Draws a purple rectangle at (33, 11) with width 73 and height 57.
; PLAN: r0=33(x), r1=11(y), r2=73(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 11
LDI r2, 73
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
