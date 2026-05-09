; DESCRIPTION: Draws a orange rectangle at (87, 85) with width 11 and height 14.
; PLAN: r0=87(x), r1=85(y), r2=11(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 85
LDI r2, 11
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
