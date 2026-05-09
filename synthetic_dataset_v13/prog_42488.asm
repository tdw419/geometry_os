; DESCRIPTION: Draws a green rectangle at (374, 114) with width 110 and height 49.
; PLAN: r0=374(x), r1=114(y), r2=110(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 114
LDI r2, 110
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
