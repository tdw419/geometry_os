; DESCRIPTION: Draws a black rectangle at (287, 226) with width 11 and height 29.
; PLAN: r0=287(x), r1=226(y), r2=11(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 226
LDI r2, 11
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
