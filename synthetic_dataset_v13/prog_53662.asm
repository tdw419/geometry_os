; DESCRIPTION: Draws a black rectangle at (470, 76) with width 24 and height 101.
; PLAN: r0=470(x), r1=76(y), r2=24(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 76
LDI r2, 24
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
