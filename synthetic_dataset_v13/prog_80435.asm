; DESCRIPTION: Draws a black rectangle at (457, 40) with width 19 and height 71.
; PLAN: r0=457(x), r1=40(y), r2=19(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 40
LDI r2, 19
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
