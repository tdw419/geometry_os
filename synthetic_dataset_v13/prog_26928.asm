; DESCRIPTION: Draws a orange rectangle at (4, 85) with width 90 and height 80.
; PLAN: r0=4(x), r1=85(y), r2=90(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 85
LDI r2, 90
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
