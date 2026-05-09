; DESCRIPTION: Draws a green rectangle at (94, 52) with width 89 and height 53.
; PLAN: r0=94(x), r1=52(y), r2=89(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 52
LDI r2, 89
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
