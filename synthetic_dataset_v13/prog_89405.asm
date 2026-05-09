; DESCRIPTION: Draws a green rectangle at (338, 10) with width 17 and height 104.
; PLAN: r0=338(x), r1=10(y), r2=17(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 10
LDI r2, 17
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
