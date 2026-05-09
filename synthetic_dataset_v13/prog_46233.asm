; DESCRIPTION: Draws a yellow rectangle at (227, 29) with width 94 and height 53.
; PLAN: r0=227(x), r1=29(y), r2=94(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 29
LDI r2, 94
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
