; DESCRIPTION: Draws a purple rectangle at (9, 194) with width 65 and height 20.
; PLAN: r0=9(x), r1=194(y), r2=65(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 194
LDI r2, 65
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
