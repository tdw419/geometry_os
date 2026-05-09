; DESCRIPTION: Draws a blue rectangle at (192, 55) with width 102 and height 115.
; PLAN: r0=192(x), r1=55(y), r2=102(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 55
LDI r2, 102
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
