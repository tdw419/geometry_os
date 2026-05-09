; DESCRIPTION: Draws a purple rectangle at (251, 9) with width 11 and height 85.
; PLAN: r0=251(x), r1=9(y), r2=11(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 9
LDI r2, 11
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
