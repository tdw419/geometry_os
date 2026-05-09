; DESCRIPTION: Draws a black rectangle at (230, 24) with width 81 and height 101.
; PLAN: r0=230(x), r1=24(y), r2=81(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 24
LDI r2, 81
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
