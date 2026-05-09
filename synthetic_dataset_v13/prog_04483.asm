; DESCRIPTION: Draws a blue rectangle at (136, 120) with width 23 and height 69.
; PLAN: r0=136(x), r1=120(y), r2=23(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 120
LDI r2, 23
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
