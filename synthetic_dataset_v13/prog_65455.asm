; DESCRIPTION: Draws a purple rectangle at (280, 139) with width 91 and height 22.
; PLAN: r0=280(x), r1=139(y), r2=91(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 139
LDI r2, 91
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
