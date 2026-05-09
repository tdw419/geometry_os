; DESCRIPTION: Draws a green rectangle at (17, 20) with width 36 and height 81.
; PLAN: r0=17(x), r1=20(y), r2=36(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 20
LDI r2, 36
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
