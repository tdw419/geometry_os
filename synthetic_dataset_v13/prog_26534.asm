; DESCRIPTION: Draws a orange rectangle at (82, 54) with width 85 and height 110.
; PLAN: r0=82(x), r1=54(y), r2=85(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 54
LDI r2, 85
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
