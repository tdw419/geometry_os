; DESCRIPTION: Draws a black rectangle at (52, 55) with width 20 and height 17.
; PLAN: r0=52(x), r1=55(y), r2=20(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 55
LDI r2, 20
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
