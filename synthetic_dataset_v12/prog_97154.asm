; DESCRIPTION: Draws a black rectangle at (458, 232) with width 17 and height 11.
; PLAN: r0=458(x), r1=232(y), r2=17(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 232
LDI r2, 17
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
