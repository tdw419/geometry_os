; DESCRIPTION: Draws a orange rectangle at (246, 142) with width 51 and height 37.
; PLAN: r0=246(x), r1=142(y), r2=51(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 142
LDI r2, 51
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
