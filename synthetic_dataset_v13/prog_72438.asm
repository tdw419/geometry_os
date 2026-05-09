; DESCRIPTION: Draws a black rectangle at (144, 106) with width 89 and height 113.
; PLAN: r0=144(x), r1=106(y), r2=89(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 106
LDI r2, 89
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
