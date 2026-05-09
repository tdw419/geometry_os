; DESCRIPTION: Draws a orange rectangle at (178, 106) with width 116 and height 96.
; PLAN: r0=178(x), r1=106(y), r2=116(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 106
LDI r2, 116
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
