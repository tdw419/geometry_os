; DESCRIPTION: Draws a orange rectangle at (261, 85) with width 30 and height 100.
; PLAN: r0=261(x), r1=85(y), r2=30(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 85
LDI r2, 30
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
