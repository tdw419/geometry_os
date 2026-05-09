; DESCRIPTION: Draws a black rectangle at (349, 17) with width 89 and height 23.
; PLAN: r0=349(x), r1=17(y), r2=89(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 17
LDI r2, 89
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
