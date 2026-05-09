; DESCRIPTION: Draws a yellow rectangle at (24, 24) with width 100 and height 46.
; PLAN: r0=24(x), r1=24(y), r2=100(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 24
LDI r2, 100
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
