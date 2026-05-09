; DESCRIPTION: Draws a yellow rectangle at (125, 166) with width 85 and height 43.
; PLAN: r0=125(x), r1=166(y), r2=85(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 166
LDI r2, 85
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
