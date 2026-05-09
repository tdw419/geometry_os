; DESCRIPTION: Draws a yellow rectangle at (147, 60) with width 85 and height 34.
; PLAN: r0=147(x), r1=60(y), r2=85(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 60
LDI r2, 85
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
