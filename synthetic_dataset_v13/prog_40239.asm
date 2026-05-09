; DESCRIPTION: Draws a black rectangle at (52, 101) with width 95 and height 30.
; PLAN: r0=52(x), r1=101(y), r2=95(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 101
LDI r2, 95
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
