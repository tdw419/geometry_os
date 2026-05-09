; DESCRIPTION: Draws a purple rectangle at (298, 119) with width 58 and height 88.
; PLAN: r0=298(x), r1=119(y), r2=58(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 119
LDI r2, 58
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
