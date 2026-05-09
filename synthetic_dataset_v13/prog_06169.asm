; DESCRIPTION: Draws a orange rectangle at (5, 157) with width 98 and height 60.
; PLAN: r0=5(x), r1=157(y), r2=98(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 157
LDI r2, 98
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
