; DESCRIPTION: Draws a yellow rectangle at (55, 63) with width 89 and height 50.
; PLAN: r0=55(x), r1=63(y), r2=89(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 63
LDI r2, 89
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
