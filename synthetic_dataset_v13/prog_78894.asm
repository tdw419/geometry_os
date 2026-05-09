; DESCRIPTION: Draws a orange rectangle at (114, 100) with width 38 and height 53.
; PLAN: r0=114(x), r1=100(y), r2=38(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 100
LDI r2, 38
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
