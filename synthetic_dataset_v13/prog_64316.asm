; DESCRIPTION: Draws a orange rectangle at (151, 106) with width 85 and height 96.
; PLAN: r0=151(x), r1=106(y), r2=85(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 106
LDI r2, 85
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
