; DESCRIPTION: Draws a black rectangle at (91, 183) with width 56 and height 66.
; PLAN: r0=91(x), r1=183(y), r2=56(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 183
LDI r2, 56
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
