; DESCRIPTION: Draws a orange rectangle at (77, 157) with width 63 and height 81.
; PLAN: r0=77(x), r1=157(y), r2=63(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 157
LDI r2, 63
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
