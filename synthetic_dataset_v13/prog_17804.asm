; DESCRIPTION: Draws a orange rectangle at (191, 97) with width 53 and height 62.
; PLAN: r0=191(x), r1=97(y), r2=53(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 97
LDI r2, 53
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
