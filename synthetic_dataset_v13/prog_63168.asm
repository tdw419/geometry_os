; DESCRIPTION: Draws a black rectangle at (204, 37) with width 119 and height 111.
; PLAN: r0=204(x), r1=37(y), r2=119(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 37
LDI r2, 119
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
