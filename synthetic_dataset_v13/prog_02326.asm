; DESCRIPTION: Draws a black rectangle at (122, 107) with width 19 and height 90.
; PLAN: r0=122(x), r1=107(y), r2=19(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 107
LDI r2, 19
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
