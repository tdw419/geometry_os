; DESCRIPTION: Draws a black rectangle at (204, 101) with width 55 and height 93.
; PLAN: r0=204(x), r1=101(y), r2=55(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 101
LDI r2, 55
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
