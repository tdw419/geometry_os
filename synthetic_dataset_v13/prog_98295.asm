; DESCRIPTION: Draws a purple rectangle at (124, 86) with width 106 and height 92.
; PLAN: r0=124(x), r1=86(y), r2=106(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 86
LDI r2, 106
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
