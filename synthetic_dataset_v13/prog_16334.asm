; DESCRIPTION: Draws a yellow rectangle at (311, 24) with width 52 and height 54.
; PLAN: r0=311(x), r1=24(y), r2=52(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 24
LDI r2, 52
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
