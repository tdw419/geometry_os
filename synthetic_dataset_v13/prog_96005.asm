; DESCRIPTION: Draws a green rectangle at (359, 108) with width 19 and height 117.
; PLAN: r0=359(x), r1=108(y), r2=19(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 108
LDI r2, 19
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
