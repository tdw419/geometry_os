; DESCRIPTION: Draws a purple rectangle at (40, 151) with width 35 and height 21.
; PLAN: r0=40(x), r1=151(y), r2=35(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 151
LDI r2, 35
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
