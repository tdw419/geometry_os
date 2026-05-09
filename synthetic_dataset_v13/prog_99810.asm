; DESCRIPTION: Draws a orange rectangle at (17, 139) with width 89 and height 111.
; PLAN: r0=17(x), r1=139(y), r2=89(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 139
LDI r2, 89
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
