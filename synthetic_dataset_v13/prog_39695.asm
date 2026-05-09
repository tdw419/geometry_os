; DESCRIPTION: Draws a orange rectangle at (35, 25) with width 15 and height 109.
; PLAN: r0=35(x), r1=25(y), r2=15(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 25
LDI r2, 15
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
