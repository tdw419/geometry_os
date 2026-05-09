; DESCRIPTION: Draws a yellow rectangle at (91, 123) with width 73 and height 32.
; PLAN: r0=91(x), r1=123(y), r2=73(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 123
LDI r2, 73
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
