; DESCRIPTION: Draws a orange rectangle at (118, 2) with width 114 and height 118.
; PLAN: r0=118(x), r1=2(y), r2=114(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 2
LDI r2, 114
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
