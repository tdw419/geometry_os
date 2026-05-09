; DESCRIPTION: Draws a green rectangle at (332, 45) with width 17 and height 30.
; PLAN: r0=332(x), r1=45(y), r2=17(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 45
LDI r2, 17
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
