; DESCRIPTION: Draws a orange rectangle at (153, 27) with width 51 and height 106.
; PLAN: r0=153(x), r1=27(y), r2=51(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 27
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
