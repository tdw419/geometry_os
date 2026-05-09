; DESCRIPTION: Draws a purple rectangle at (204, 58) with width 96 and height 50.
; PLAN: r0=204(x), r1=58(y), r2=96(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 58
LDI r2, 96
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
