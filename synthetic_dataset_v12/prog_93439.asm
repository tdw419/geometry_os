; DESCRIPTION: Draws a purple rectangle at (411, 112) with width 69 and height 76.
; PLAN: r0=411(x), r1=112(y), r2=69(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 112
LDI r2, 69
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
