; DESCRIPTION: Draws a green rectangle at (149, 161) with width 65 and height 47.
; PLAN: r0=149(x), r1=161(y), r2=65(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 161
LDI r2, 65
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
