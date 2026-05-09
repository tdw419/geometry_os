; DESCRIPTION: Draws a purple rectangle at (150, 77) with width 78 and height 92.
; PLAN: r0=150(x), r1=77(y), r2=78(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 77
LDI r2, 78
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
