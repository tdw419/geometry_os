; DESCRIPTION: Draws a green rectangle at (220, 183) with width 89 and height 10.
; PLAN: r0=220(x), r1=183(y), r2=89(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 183
LDI r2, 89
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
