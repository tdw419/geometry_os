; DESCRIPTION: Draws a purple rectangle at (275, 125) with width 89 and height 52.
; PLAN: r0=275(x), r1=125(y), r2=89(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 125
LDI r2, 89
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
