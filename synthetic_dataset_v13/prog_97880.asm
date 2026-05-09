; DESCRIPTION: Draws a green rectangle at (440, 106) with width 22 and height 50.
; PLAN: r0=440(x), r1=106(y), r2=22(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 106
LDI r2, 22
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
