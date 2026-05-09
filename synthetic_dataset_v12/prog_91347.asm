; DESCRIPTION: Draws a green rectangle at (63, 184) with width 73 and height 59.
; PLAN: r0=63(x), r1=184(y), r2=73(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 184
LDI r2, 73
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
