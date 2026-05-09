; DESCRIPTION: Draws a cyan rectangle at (359, 161) with width 17 and height 84.
; PLAN: r0=359(x), r1=161(y), r2=17(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 161
LDI r2, 17
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
