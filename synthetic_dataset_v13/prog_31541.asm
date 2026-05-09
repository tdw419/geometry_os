; DESCRIPTION: Draws a white rectangle at (212, 106) with width 101 and height 112.
; PLAN: r0=212(x), r1=106(y), r2=101(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 106
LDI r2, 101
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
