; DESCRIPTION: Draws a yellow rectangle at (13, 148) with width 63 and height 55.
; PLAN: r0=13(x), r1=148(y), r2=63(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 148
LDI r2, 63
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
