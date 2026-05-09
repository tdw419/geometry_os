; DESCRIPTION: Draws a white rectangle at (132, 140) with width 114 and height 95.
; PLAN: r0=132(x), r1=140(y), r2=114(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 140
LDI r2, 114
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
