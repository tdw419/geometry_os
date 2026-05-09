; DESCRIPTION: Draws a yellow rectangle at (2, 68) with width 84 and height 117.
; PLAN: r0=2(x), r1=68(y), r2=84(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 68
LDI r2, 84
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
