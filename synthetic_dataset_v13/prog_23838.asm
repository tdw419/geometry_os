; DESCRIPTION: Draws a green rectangle at (431, 108) with width 46 and height 115.
; PLAN: r0=431(x), r1=108(y), r2=46(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 108
LDI r2, 46
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
