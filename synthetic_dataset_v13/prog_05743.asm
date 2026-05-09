; DESCRIPTION: Draws a green rectangle at (94, 100) with width 23 and height 100.
; PLAN: r0=94(x), r1=100(y), r2=23(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 100
LDI r2, 23
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
