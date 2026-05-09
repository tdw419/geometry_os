; DESCRIPTION: Draws a green rectangle at (250, 87) with width 105 and height 101.
; PLAN: r0=250(x), r1=87(y), r2=105(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 87
LDI r2, 105
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
