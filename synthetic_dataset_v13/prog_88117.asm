; DESCRIPTION: Draws a black rectangle at (20, 4) with width 89 and height 68.
; PLAN: r0=20(x), r1=4(y), r2=89(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 4
LDI r2, 89
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
