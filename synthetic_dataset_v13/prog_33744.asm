; DESCRIPTION: Draws a green rectangle at (451, 102) with width 53 and height 34.
; PLAN: r0=451(x), r1=102(y), r2=53(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 102
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
