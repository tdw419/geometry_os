; DESCRIPTION: Draws a orange rectangle at (192, 159) with width 62 and height 53.
; PLAN: r0=192(x), r1=159(y), r2=62(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 159
LDI r2, 62
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
