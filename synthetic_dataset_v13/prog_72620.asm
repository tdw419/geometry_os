; DESCRIPTION: Draws a green rectangle at (216, 150) with width 47 and height 43.
; PLAN: r0=216(x), r1=150(y), r2=47(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 150
LDI r2, 47
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
