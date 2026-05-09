; DESCRIPTION: Draws a yellow rectangle at (327, 155) with width 14 and height 43.
; PLAN: r0=327(x), r1=155(y), r2=14(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 155
LDI r2, 14
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
