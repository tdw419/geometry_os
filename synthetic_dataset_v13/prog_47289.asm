; DESCRIPTION: Draws a green rectangle at (345, 40) with width 66 and height 60.
; PLAN: r0=345(x), r1=40(y), r2=66(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 40
LDI r2, 66
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
