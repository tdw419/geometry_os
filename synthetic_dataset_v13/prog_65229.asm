; DESCRIPTION: Draws a green rectangle at (127, 99) with width 31 and height 85.
; PLAN: r0=127(x), r1=99(y), r2=31(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 99
LDI r2, 31
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
