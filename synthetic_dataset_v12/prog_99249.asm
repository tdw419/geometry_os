; DESCRIPTION: Draws a blue rectangle at (139, 30) with width 27 and height 22.
; PLAN: r0=139(x), r1=30(y), r2=27(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 30
LDI r2, 27
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
