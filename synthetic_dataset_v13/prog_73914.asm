; DESCRIPTION: Draws a orange rectangle at (86, 3) with width 100 and height 30.
; PLAN: r0=86(x), r1=3(y), r2=100(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 3
LDI r2, 100
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
