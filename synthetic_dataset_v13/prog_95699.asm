; DESCRIPTION: Draws a green rectangle at (212, 89) with width 105 and height 24.
; PLAN: r0=212(x), r1=89(y), r2=105(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 89
LDI r2, 105
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
