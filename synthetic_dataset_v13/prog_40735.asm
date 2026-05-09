; DESCRIPTION: Draws a orange rectangle at (62, 132) with width 53 and height 83.
; PLAN: r0=62(x), r1=132(y), r2=53(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 132
LDI r2, 53
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
