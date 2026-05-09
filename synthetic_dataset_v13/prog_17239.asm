; DESCRIPTION: Draws a red rectangle at (159, 54) with width 102 and height 26.
; PLAN: r0=159(x), r1=54(y), r2=102(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 54
LDI r2, 102
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
