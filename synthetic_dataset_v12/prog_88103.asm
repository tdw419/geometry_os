; DESCRIPTION: Draws a orange rectangle at (204, 4) with width 49 and height 81.
; PLAN: r0=204(x), r1=4(y), r2=49(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 4
LDI r2, 49
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
