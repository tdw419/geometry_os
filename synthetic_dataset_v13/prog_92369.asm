; DESCRIPTION: Draws a orange rectangle at (297, 123) with width 94 and height 89.
; PLAN: r0=297(x), r1=123(y), r2=94(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 123
LDI r2, 94
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
