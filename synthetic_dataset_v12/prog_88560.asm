; DESCRIPTION: Draws a black rectangle at (49, 185) with width 109 and height 71.
; PLAN: r0=49(x), r1=185(y), r2=109(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 185
LDI r2, 109
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
