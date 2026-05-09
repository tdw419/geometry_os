; DESCRIPTION: Draws a orange rectangle at (129, 26) with width 81 and height 29.
; PLAN: r0=129(x), r1=26(y), r2=81(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 26
LDI r2, 81
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
