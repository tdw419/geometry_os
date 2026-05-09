; DESCRIPTION: Draws a black rectangle at (245, 35) with width 40 and height 94.
; PLAN: r0=245(x), r1=35(y), r2=40(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 35
LDI r2, 40
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
