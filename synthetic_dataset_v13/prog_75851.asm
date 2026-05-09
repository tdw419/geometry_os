; DESCRIPTION: Draws a green rectangle at (86, 4) with width 10 and height 106.
; PLAN: r0=86(x), r1=4(y), r2=10(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 4
LDI r2, 10
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
