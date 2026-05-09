; DESCRIPTION: Draws a orange rectangle at (71, 142) with width 89 and height 23.
; PLAN: r0=71(x), r1=142(y), r2=89(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 142
LDI r2, 89
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
