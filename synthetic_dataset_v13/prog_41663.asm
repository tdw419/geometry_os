; DESCRIPTION: Draws a green rectangle at (371, 63) with width 89 and height 49.
; PLAN: r0=371(x), r1=63(y), r2=89(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 63
LDI r2, 89
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
