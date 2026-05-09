; DESCRIPTION: Draws a black rectangle at (291, 35) with width 112 and height 50.
; PLAN: r0=291(x), r1=35(y), r2=112(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 35
LDI r2, 112
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
