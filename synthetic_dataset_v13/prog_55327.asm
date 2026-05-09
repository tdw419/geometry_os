; DESCRIPTION: Draws a yellow rectangle at (47, 156) with width 112 and height 54.
; PLAN: r0=47(x), r1=156(y), r2=112(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 156
LDI r2, 112
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
