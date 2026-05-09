; DESCRIPTION: Draws a yellow rectangle at (374, 201) with width 55 and height 40.
; PLAN: r0=374(x), r1=201(y), r2=55(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 201
LDI r2, 55
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
