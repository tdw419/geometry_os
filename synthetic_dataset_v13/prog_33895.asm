; DESCRIPTION: Draws a orange rectangle at (76, 110) with width 90 and height 49.
; PLAN: r0=76(x), r1=110(y), r2=90(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 110
LDI r2, 90
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
