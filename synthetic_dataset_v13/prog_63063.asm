; DESCRIPTION: Draws a orange rectangle at (221, 118) with width 47 and height 100.
; PLAN: r0=221(x), r1=118(y), r2=47(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 118
LDI r2, 47
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
