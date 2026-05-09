; DESCRIPTION: Draws a yellow rectangle at (109, 24) with width 63 and height 119.
; PLAN: r0=109(x), r1=24(y), r2=63(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 63
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
