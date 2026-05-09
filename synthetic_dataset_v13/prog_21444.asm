; DESCRIPTION: Draws a purple rectangle at (282, 76) with width 104 and height 26.
; PLAN: r0=282(x), r1=76(y), r2=104(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 76
LDI r2, 104
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
