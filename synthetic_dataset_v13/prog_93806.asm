; DESCRIPTION: Draws a green rectangle at (68, 3) with width 18 and height 98.
; PLAN: r0=68(x), r1=3(y), r2=18(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 3
LDI r2, 18
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
