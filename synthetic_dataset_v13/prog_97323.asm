; DESCRIPTION: Draws a purple rectangle at (199, 7) with width 31 and height 117.
; PLAN: r0=199(x), r1=7(y), r2=31(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 7
LDI r2, 31
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
