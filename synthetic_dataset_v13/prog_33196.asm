; DESCRIPTION: Draws a yellow rectangle at (472, 50) with width 36 and height 89.
; PLAN: r0=472(x), r1=50(y), r2=36(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 50
LDI r2, 36
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
