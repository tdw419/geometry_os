; DESCRIPTION: Draws a blue rectangle at (240, 139) with width 91 and height 50.
; PLAN: r0=240(x), r1=139(y), r2=91(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 139
LDI r2, 91
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
