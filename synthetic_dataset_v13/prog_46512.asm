; DESCRIPTION: Draws a purple rectangle at (165, 145) with width 19 and height 61.
; PLAN: r0=165(x), r1=145(y), r2=19(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 145
LDI r2, 19
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
