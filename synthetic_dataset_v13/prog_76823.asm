; DESCRIPTION: Draws a black rectangle at (155, 109) with width 108 and height 98.
; PLAN: r0=155(x), r1=109(y), r2=108(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 109
LDI r2, 108
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
