; DESCRIPTION: Draws a blue rectangle at (139, 81) with width 82 and height 119.
; PLAN: r0=139(x), r1=81(y), r2=82(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 81
LDI r2, 82
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
