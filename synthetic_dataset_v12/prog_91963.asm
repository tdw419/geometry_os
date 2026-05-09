; DESCRIPTION: Draws a purple rectangle at (138, 2) with width 20 and height 72.
; PLAN: r0=138(x), r1=2(y), r2=20(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 2
LDI r2, 20
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
