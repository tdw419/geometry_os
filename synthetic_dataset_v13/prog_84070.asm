; DESCRIPTION: Draws a black rectangle at (159, 200) with width 91 and height 38.
; PLAN: r0=159(x), r1=200(y), r2=91(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 200
LDI r2, 91
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
