; DESCRIPTION: Draws a black rectangle at (310, 187) with width 66 and height 26.
; PLAN: r0=310(x), r1=187(y), r2=66(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 187
LDI r2, 66
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
