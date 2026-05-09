; DESCRIPTION: Draws a black rectangle at (204, 6) with width 94 and height 109.
; PLAN: r0=204(x), r1=6(y), r2=94(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 6
LDI r2, 94
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
