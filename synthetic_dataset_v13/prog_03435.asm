; DESCRIPTION: Draws a green rectangle at (56, 167) with width 19 and height 52.
; PLAN: r0=56(x), r1=167(y), r2=19(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 167
LDI r2, 19
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
