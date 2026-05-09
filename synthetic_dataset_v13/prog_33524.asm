; DESCRIPTION: Draws a blue rectangle at (133, 106) with width 69 and height 120.
; PLAN: r0=133(x), r1=106(y), r2=69(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 106
LDI r2, 69
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
