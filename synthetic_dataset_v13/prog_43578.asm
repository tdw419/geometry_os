; DESCRIPTION: Draws a yellow rectangle at (181, 100) with width 68 and height 21.
; PLAN: r0=181(x), r1=100(y), r2=68(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 100
LDI r2, 68
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
