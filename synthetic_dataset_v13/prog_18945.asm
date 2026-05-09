; DESCRIPTION: Draws a white rectangle at (66, 106) with width 23 and height 44.
; PLAN: r0=66(x), r1=106(y), r2=23(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 106
LDI r2, 23
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
