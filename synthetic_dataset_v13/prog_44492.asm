; DESCRIPTION: Draws a purple rectangle at (293, 54) with width 94 and height 57.
; PLAN: r0=293(x), r1=54(y), r2=94(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 54
LDI r2, 94
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
