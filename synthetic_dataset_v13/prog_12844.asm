; DESCRIPTION: Draws a purple rectangle at (6, 46) with width 31 and height 45.
; PLAN: r0=6(x), r1=46(y), r2=31(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 46
LDI r2, 31
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
