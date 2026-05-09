; DESCRIPTION: Draws a purple rectangle at (407, 1) with width 38 and height 58.
; PLAN: r0=407(x), r1=1(y), r2=38(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 1
LDI r2, 38
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
