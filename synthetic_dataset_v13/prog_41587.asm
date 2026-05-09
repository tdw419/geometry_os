; DESCRIPTION: Renders a orange box of size 112x106 starting at (147, 97).
; PLAN: r0=147(x), r1=97(y), r2=112(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 97
LDI r2, 112
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
