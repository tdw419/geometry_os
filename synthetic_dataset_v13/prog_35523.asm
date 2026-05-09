; DESCRIPTION: Draws a blue rectangle at (378, 1) with width 65 and height 69.
; PLAN: r0=378(x), r1=1(y), r2=65(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 1
LDI r2, 65
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
