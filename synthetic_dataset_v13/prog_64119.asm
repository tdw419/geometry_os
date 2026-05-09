; DESCRIPTION: Draws a black rectangle at (69, 167) with width 78 and height 62.
; PLAN: r0=69(x), r1=167(y), r2=78(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 167
LDI r2, 78
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
