; DESCRIPTION: Draws a orange rectangle at (326, 71) with width 108 and height 94.
; PLAN: r0=326(x), r1=71(y), r2=108(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 71
LDI r2, 108
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
