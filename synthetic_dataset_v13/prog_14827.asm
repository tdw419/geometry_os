; DESCRIPTION: Draws a purple rectangle at (282, 166) with width 100 and height 40.
; PLAN: r0=282(x), r1=166(y), r2=100(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 166
LDI r2, 100
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
