; DESCRIPTION: Draws a yellow rectangle at (147, 189) with width 113 and height 54.
; PLAN: r0=147(x), r1=189(y), r2=113(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 189
LDI r2, 113
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
