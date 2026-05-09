; DESCRIPTION: Draws a black rectangle at (210, 108) with width 43 and height 115.
; PLAN: r0=210(x), r1=108(y), r2=43(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 108
LDI r2, 43
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
