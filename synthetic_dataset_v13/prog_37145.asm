; DESCRIPTION: Draws a black rectangle at (254, 15) with width 25 and height 20.
; PLAN: r0=254(x), r1=15(y), r2=25(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 15
LDI r2, 25
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
