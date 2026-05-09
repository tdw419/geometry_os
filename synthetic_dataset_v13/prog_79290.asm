; DESCRIPTION: Draws a black rectangle at (109, 69) with width 18 and height 76.
; PLAN: r0=109(x), r1=69(y), r2=18(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 69
LDI r2, 18
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
