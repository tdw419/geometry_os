; DESCRIPTION: Draws a black rectangle at (319, 18) with width 107 and height 115.
; PLAN: r0=319(x), r1=18(y), r2=107(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 18
LDI r2, 107
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
