; DESCRIPTION: Draws a orange rectangle at (93, 140) with width 119 and height 114.
; PLAN: r0=93(x), r1=140(y), r2=119(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 140
LDI r2, 119
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
