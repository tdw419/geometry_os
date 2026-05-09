; DESCRIPTION: Draws a black rectangle at (414, 53) with width 34 and height 102.
; PLAN: r0=414(x), r1=53(y), r2=34(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 53
LDI r2, 34
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
