; DESCRIPTION: Draws a purple rectangle at (75, 92) with width 78 and height 46.
; PLAN: r0=75(x), r1=92(y), r2=78(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 92
LDI r2, 78
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
