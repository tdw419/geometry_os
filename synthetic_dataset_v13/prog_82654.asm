; DESCRIPTION: Draws a purple rectangle at (239, 10) with width 35 and height 119.
; PLAN: r0=239(x), r1=10(y), r2=35(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 10
LDI r2, 35
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
