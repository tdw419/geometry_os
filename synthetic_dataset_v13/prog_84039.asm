; DESCRIPTION: Draws a yellow rectangle at (343, 117) with width 53 and height 94.
; PLAN: r0=343(x), r1=117(y), r2=53(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 117
LDI r2, 53
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
