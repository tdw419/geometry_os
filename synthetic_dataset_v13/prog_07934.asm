; DESCRIPTION: Draws a orange rectangle at (51, 150) with width 69 and height 78.
; PLAN: r0=51(x), r1=150(y), r2=69(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 150
LDI r2, 69
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
