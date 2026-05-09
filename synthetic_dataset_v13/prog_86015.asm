; DESCRIPTION: Draws a orange rectangle at (408, 81) with width 43 and height 77.
; PLAN: r0=408(x), r1=81(y), r2=43(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 81
LDI r2, 43
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
