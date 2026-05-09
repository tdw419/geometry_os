; DESCRIPTION: Draws a black rectangle at (107, 28) with width 17 and height 49.
; PLAN: r0=107(x), r1=28(y), r2=17(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 28
LDI r2, 17
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
