; DESCRIPTION: Draws a purple rectangle at (9, 20) with width 48 and height 100.
; PLAN: r0=9(x), r1=20(y), r2=48(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 48
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
