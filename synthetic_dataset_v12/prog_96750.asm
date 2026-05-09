; DESCRIPTION: Draws a blue rectangle at (37, 55) with width 105 and height 120.
; PLAN: r0=37(x), r1=55(y), r2=105(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 55
LDI r2, 105
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
