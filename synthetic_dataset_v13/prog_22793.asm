; DESCRIPTION: Draws a green rectangle at (186, 65) with width 39 and height 89.
; PLAN: r0=186(x), r1=65(y), r2=39(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 65
LDI r2, 39
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
