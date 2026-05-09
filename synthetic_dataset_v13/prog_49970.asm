; DESCRIPTION: Draws a green rectangle at (374, 56) with width 62 and height 20.
; PLAN: r0=374(x), r1=56(y), r2=62(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 56
LDI r2, 62
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
