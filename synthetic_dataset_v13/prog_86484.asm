; DESCRIPTION: Draws a black rectangle at (245, 60) with width 35 and height 76.
; PLAN: r0=245(x), r1=60(y), r2=35(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 60
LDI r2, 35
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
