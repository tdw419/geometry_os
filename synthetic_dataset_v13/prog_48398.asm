; DESCRIPTION: Draws a blue rectangle at (204, 123) with width 13 and height 21.
; PLAN: r0=204(x), r1=123(y), r2=13(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 123
LDI r2, 13
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
