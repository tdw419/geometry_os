; DESCRIPTION: Draws a black rectangle at (253, 4) with width 78 and height 53.
; PLAN: r0=253(x), r1=4(y), r2=78(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 4
LDI r2, 78
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
