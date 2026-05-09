; DESCRIPTION: Draws a green rectangle at (150, 23) with width 96 and height 115.
; PLAN: r0=150(x), r1=23(y), r2=96(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 23
LDI r2, 96
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
