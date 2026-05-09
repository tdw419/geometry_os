; DESCRIPTION: Draws a green rectangle at (181, 108) with width 98 and height 55.
; PLAN: r0=181(x), r1=108(y), r2=98(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 108
LDI r2, 98
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
