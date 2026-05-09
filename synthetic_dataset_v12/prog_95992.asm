; DESCRIPTION: Draws a orange rectangle at (233, 115) with width 15 and height 18.
; PLAN: r0=233(x), r1=115(y), r2=15(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 115
LDI r2, 15
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
