; DESCRIPTION: Draws a purple rectangle at (142, 184) with width 50 and height 13.
; PLAN: r0=142(x), r1=184(y), r2=50(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 184
LDI r2, 50
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
