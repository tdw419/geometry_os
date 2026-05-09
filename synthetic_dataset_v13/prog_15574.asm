; DESCRIPTION: Draws a black rectangle at (421, 180) with width 25 and height 26.
; PLAN: r0=421(x), r1=180(y), r2=25(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 180
LDI r2, 25
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
