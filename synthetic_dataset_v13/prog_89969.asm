; DESCRIPTION: Draws a black rectangle at (388, 19) with width 62 and height 100.
; PLAN: r0=388(x), r1=19(y), r2=62(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 19
LDI r2, 62
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
