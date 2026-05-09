; DESCRIPTION: Draws a orange rectangle at (51, 110) with width 70 and height 82.
; PLAN: r0=51(x), r1=110(y), r2=70(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 110
LDI r2, 70
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
