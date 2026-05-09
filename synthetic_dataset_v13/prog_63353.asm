; DESCRIPTION: Draws a black rectangle at (426, 106) with width 35 and height 120.
; PLAN: r0=426(x), r1=106(y), r2=35(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 106
LDI r2, 35
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
