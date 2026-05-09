; DESCRIPTION: Draws a green rectangle at (365, 37) with width 106 and height 94.
; PLAN: r0=365(x), r1=37(y), r2=106(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 37
LDI r2, 106
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
