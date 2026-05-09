; DESCRIPTION: Draws a black rectangle at (285, 88) with width 52 and height 91.
; PLAN: r0=285(x), r1=88(y), r2=52(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 88
LDI r2, 52
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
