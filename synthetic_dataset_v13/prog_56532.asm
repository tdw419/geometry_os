; DESCRIPTION: Draws a orange rectangle at (326, 46) with width 11 and height 53.
; PLAN: r0=326(x), r1=46(y), r2=11(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 46
LDI r2, 11
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
