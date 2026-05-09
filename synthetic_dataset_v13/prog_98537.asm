; DESCRIPTION: Draws a orange rectangle at (55, 13) with width 35 and height 107.
; PLAN: r0=55(x), r1=13(y), r2=35(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 13
LDI r2, 35
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
