; DESCRIPTION: Draws a orange rectangle at (83, 2) with width 55 and height 76.
; PLAN: r0=83(x), r1=2(y), r2=55(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 2
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
