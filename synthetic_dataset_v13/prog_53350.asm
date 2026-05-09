; DESCRIPTION: Draws a green rectangle at (374, 78) with width 60 and height 17.
; PLAN: r0=374(x), r1=78(y), r2=60(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 78
LDI r2, 60
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
