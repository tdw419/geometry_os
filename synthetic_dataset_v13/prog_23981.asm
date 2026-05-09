; DESCRIPTION: Draws a green rectangle at (359, 90) with width 63 and height 68.
; PLAN: r0=359(x), r1=90(y), r2=63(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 90
LDI r2, 63
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
