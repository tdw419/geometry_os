; DESCRIPTION: Draws a orange rectangle at (311, 140) with width 33 and height 87.
; PLAN: r0=311(x), r1=140(y), r2=33(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 140
LDI r2, 33
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
