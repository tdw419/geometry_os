; DESCRIPTION: Draws a black rectangle at (159, 160) with width 19 and height 95.
; PLAN: r0=159(x), r1=160(y), r2=19(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 160
LDI r2, 19
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
