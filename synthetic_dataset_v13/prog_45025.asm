; DESCRIPTION: Draws a blue rectangle at (108, 4) with width 69 and height 63.
; PLAN: r0=108(x), r1=4(y), r2=69(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 4
LDI r2, 69
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
