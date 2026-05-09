; DESCRIPTION: Draws a purple rectangle at (293, 186) with width 78 and height 14.
; PLAN: r0=293(x), r1=186(y), r2=78(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 186
LDI r2, 78
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
