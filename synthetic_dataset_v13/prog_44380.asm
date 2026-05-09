; DESCRIPTION: Draws a purple rectangle at (11, 164) with width 29 and height 58.
; PLAN: r0=11(x), r1=164(y), r2=29(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 164
LDI r2, 29
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
