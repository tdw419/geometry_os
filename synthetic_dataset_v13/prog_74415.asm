; DESCRIPTION: Draws a yellow rectangle at (200, 176) with width 25 and height 13.
; PLAN: r0=200(x), r1=176(y), r2=25(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 176
LDI r2, 25
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
