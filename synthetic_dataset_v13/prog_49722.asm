; DESCRIPTION: Draws a black rectangle at (362, 78) with width 25 and height 66.
; PLAN: r0=362(x), r1=78(y), r2=25(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 78
LDI r2, 25
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
