; DESCRIPTION: Draws a purple rectangle at (134, 77) with width 79 and height 60.
; PLAN: r0=134(x), r1=77(y), r2=79(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 77
LDI r2, 79
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
