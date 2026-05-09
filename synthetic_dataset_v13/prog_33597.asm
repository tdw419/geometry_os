; DESCRIPTION: Draws a orange rectangle at (73, 139) with width 100 and height 56.
; PLAN: r0=73(x), r1=139(y), r2=100(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 139
LDI r2, 100
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
