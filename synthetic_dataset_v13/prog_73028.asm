; DESCRIPTION: Draws a orange rectangle at (246, 112) with width 51 and height 101.
; PLAN: r0=246(x), r1=112(y), r2=51(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 112
LDI r2, 51
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
