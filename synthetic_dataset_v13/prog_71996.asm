; DESCRIPTION: Draws a purple rectangle at (210, 18) with width 88 and height 40.
; PLAN: r0=210(x), r1=18(y), r2=88(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 18
LDI r2, 88
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
