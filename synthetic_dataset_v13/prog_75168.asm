; DESCRIPTION: Draws a yellow rectangle at (332, 9) with width 120 and height 89.
; PLAN: r0=332(x), r1=9(y), r2=120(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 9
LDI r2, 120
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
