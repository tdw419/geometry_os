; DESCRIPTION: Draws a yellow rectangle at (80, 139) with width 63 and height 37.
; PLAN: r0=80(x), r1=139(y), r2=63(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 139
LDI r2, 63
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
