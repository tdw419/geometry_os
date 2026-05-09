; DESCRIPTION: Draws a black rectangle at (310, 31) with width 95 and height 118.
; PLAN: r0=310(x), r1=31(y), r2=95(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 31
LDI r2, 95
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
