; DESCRIPTION: Draws a green rectangle at (2, 133) with width 78 and height 17.
; PLAN: r0=2(x), r1=133(y), r2=78(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 133
LDI r2, 78
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
