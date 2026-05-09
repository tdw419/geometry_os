; DESCRIPTION: Draws a black rectangle at (265, 3) with width 66 and height 52.
; PLAN: r0=265(x), r1=3(y), r2=66(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 3
LDI r2, 66
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
