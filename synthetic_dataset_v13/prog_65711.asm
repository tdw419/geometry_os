; DESCRIPTION: Draws a blue rectangle at (331, 184) with width 91 and height 23.
; PLAN: r0=331(x), r1=184(y), r2=91(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 184
LDI r2, 91
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
