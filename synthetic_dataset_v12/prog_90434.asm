; DESCRIPTION: Draws a orange rectangle at (490, 60) with width 12 and height 76.
; PLAN: r0=490(x), r1=60(y), r2=12(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 60
LDI r2, 12
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
