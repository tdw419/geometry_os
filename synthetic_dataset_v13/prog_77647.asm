; DESCRIPTION: Draws a black rectangle at (122, 13) with width 65 and height 107.
; PLAN: r0=122(x), r1=13(y), r2=65(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 13
LDI r2, 65
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
