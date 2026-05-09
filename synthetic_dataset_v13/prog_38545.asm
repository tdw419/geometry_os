; DESCRIPTION: Draws a orange rectangle at (3, 31) with width 83 and height 83.
; PLAN: r0=3(x), r1=31(y), r2=83(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 31
LDI r2, 83
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
