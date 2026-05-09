; DESCRIPTION: Draws a orange rectangle at (114, 150) with width 119 and height 44.
; PLAN: r0=114(x), r1=150(y), r2=119(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 150
LDI r2, 119
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
