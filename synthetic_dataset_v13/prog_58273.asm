; DESCRIPTION: Draws a green rectangle at (472, 164) with width 15 and height 49.
; PLAN: r0=472(x), r1=164(y), r2=15(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 164
LDI r2, 15
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
