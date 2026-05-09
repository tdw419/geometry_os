; DESCRIPTION: Draws a orange rectangle at (151, 118) with width 102 and height 115.
; PLAN: r0=151(x), r1=118(y), r2=102(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 118
LDI r2, 102
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
