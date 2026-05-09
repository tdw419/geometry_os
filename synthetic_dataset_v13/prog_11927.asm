; DESCRIPTION: Draws a green rectangle at (437, 132) with width 13 and height 99.
; PLAN: r0=437(x), r1=132(y), r2=13(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 132
LDI r2, 13
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
