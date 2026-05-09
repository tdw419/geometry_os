; DESCRIPTION: Draws a purple rectangle at (399, 193) with width 25 and height 57.
; PLAN: r0=399(x), r1=193(y), r2=25(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 193
LDI r2, 25
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
