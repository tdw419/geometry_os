; DESCRIPTION: Draws a orange rectangle at (363, 50) with width 108 and height 85.
; PLAN: r0=363(x), r1=50(y), r2=108(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 50
LDI r2, 108
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
