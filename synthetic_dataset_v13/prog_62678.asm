; DESCRIPTION: Draws a blue rectangle at (162, 1) with width 37 and height 108.
; PLAN: r0=162(x), r1=1(y), r2=37(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 1
LDI r2, 37
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
