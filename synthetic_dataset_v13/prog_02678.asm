; DESCRIPTION: Draws a orange rectangle at (60, 172) with width 49 and height 80.
; PLAN: r0=60(x), r1=172(y), r2=49(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 172
LDI r2, 49
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
