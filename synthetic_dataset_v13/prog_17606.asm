; DESCRIPTION: Draws a black rectangle at (155, 58) with width 14 and height 20.
; PLAN: r0=155(x), r1=58(y), r2=14(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 58
LDI r2, 14
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
