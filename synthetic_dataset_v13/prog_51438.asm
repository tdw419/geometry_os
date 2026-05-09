; DESCRIPTION: Draws a orange rectangle at (358, 22) with width 77 and height 106.
; PLAN: r0=358(x), r1=22(y), r2=77(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 22
LDI r2, 77
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
