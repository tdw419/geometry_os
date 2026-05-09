; DESCRIPTION: Draws a purple rectangle at (84, 31) with width 45 and height 77.
; PLAN: r0=84(x), r1=31(y), r2=45(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 31
LDI r2, 45
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
