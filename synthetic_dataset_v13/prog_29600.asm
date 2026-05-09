; DESCRIPTION: Draws a orange rectangle at (85, 157) with width 70 and height 80.
; PLAN: r0=85(x), r1=157(y), r2=70(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 157
LDI r2, 70
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
