; DESCRIPTION: Draws a blue rectangle at (323, 43) with width 91 and height 116.
; PLAN: r0=323(x), r1=43(y), r2=91(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 43
LDI r2, 91
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
