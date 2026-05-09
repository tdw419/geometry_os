; DESCRIPTION: Draws a green rectangle at (0, 140) with width 25 and height 85.
; PLAN: r0=0(x), r1=140(y), r2=25(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 140
LDI r2, 25
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
