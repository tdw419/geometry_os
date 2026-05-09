; DESCRIPTION: Draws a blue rectangle at (69, 81) with width 92 and height 80.
; PLAN: r0=69(x), r1=81(y), r2=92(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 81
LDI r2, 92
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
