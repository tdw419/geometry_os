; DESCRIPTION: Draws a black rectangle at (158, 206) with width 89 and height 30.
; PLAN: r0=158(x), r1=206(y), r2=89(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 206
LDI r2, 89
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
