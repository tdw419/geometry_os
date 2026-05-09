; DESCRIPTION: Draws a black rectangle at (334, 17) with width 91 and height 95.
; PLAN: r0=334(x), r1=17(y), r2=91(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 17
LDI r2, 91
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
