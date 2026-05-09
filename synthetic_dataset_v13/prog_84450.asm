; DESCRIPTION: Draws a black rectangle at (30, 40) with width 22 and height 89.
; PLAN: r0=30(x), r1=40(y), r2=22(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 40
LDI r2, 22
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
