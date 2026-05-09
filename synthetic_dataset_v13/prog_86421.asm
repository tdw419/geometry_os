; DESCRIPTION: Draws a green rectangle at (302, 132) with width 116 and height 105.
; PLAN: r0=302(x), r1=132(y), r2=116(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 132
LDI r2, 116
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
