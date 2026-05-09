; DESCRIPTION: Draws a green rectangle at (140, 78) with width 34 and height 109.
; PLAN: r0=140(x), r1=78(y), r2=34(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 78
LDI r2, 34
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
