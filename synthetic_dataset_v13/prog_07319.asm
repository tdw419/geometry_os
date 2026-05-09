; DESCRIPTION: Draws a yellow rectangle at (3, 155) with width 53 and height 21.
; PLAN: r0=3(x), r1=155(y), r2=53(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 155
LDI r2, 53
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
