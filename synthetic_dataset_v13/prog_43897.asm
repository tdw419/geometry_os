; DESCRIPTION: Draws a black rectangle at (414, 141) with width 98 and height 76.
; PLAN: r0=414(x), r1=141(y), r2=98(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 141
LDI r2, 98
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
