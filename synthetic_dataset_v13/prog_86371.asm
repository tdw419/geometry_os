; DESCRIPTION: Draws a red rectangle at (13, 24) with width 106 and height 114.
; PLAN: r0=13(x), r1=24(y), r2=106(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 24
LDI r2, 106
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
