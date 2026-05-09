; DESCRIPTION: Draws a orange rectangle at (100, 22) with width 108 and height 107.
; PLAN: r0=100(x), r1=22(y), r2=108(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 22
LDI r2, 108
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
