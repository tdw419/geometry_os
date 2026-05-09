; DESCRIPTION: Draws a black rectangle at (345, 76) with width 94 and height 89.
; PLAN: r0=345(x), r1=76(y), r2=94(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 76
LDI r2, 94
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
