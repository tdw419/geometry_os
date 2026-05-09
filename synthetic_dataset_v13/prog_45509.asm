; DESCRIPTION: Draws a blue rectangle at (263, 108) with width 43 and height 55.
; PLAN: r0=263(x), r1=108(y), r2=43(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 108
LDI r2, 43
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
