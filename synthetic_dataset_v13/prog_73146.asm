; DESCRIPTION: Draws a green rectangle at (220, 52) with width 106 and height 57.
; PLAN: r0=220(x), r1=52(y), r2=106(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 52
LDI r2, 106
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
