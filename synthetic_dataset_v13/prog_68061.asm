; DESCRIPTION: Draws a green rectangle at (345, 100) with width 86 and height 80.
; PLAN: r0=345(x), r1=100(y), r2=86(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 100
LDI r2, 86
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
