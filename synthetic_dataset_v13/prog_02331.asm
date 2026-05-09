; DESCRIPTION: Draws a black rectangle at (159, 24) with width 67 and height 31.
; PLAN: r0=159(x), r1=24(y), r2=67(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 24
LDI r2, 67
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
