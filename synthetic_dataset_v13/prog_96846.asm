; DESCRIPTION: Draws a white rectangle at (273, 185) with width 101 and height 62.
; PLAN: r0=273(x), r1=185(y), r2=101(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 185
LDI r2, 101
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
