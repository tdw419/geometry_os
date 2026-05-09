; DESCRIPTION: Draws a purple rectangle at (102, 124) with width 56 and height 110.
; PLAN: r0=102(x), r1=124(y), r2=56(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 124
LDI r2, 56
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
