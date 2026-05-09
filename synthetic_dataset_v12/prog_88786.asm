; DESCRIPTION: Draws a blue rectangle at (77, 135) with width 53 and height 108.
; PLAN: r0=77(x), r1=135(y), r2=53(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 135
LDI r2, 53
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
