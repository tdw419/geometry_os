; DESCRIPTION: Draws a green rectangle at (350, 87) with width 97 and height 83.
; PLAN: r0=350(x), r1=87(y), r2=97(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 87
LDI r2, 97
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
