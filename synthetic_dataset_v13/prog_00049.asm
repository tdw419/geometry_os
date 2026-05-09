; DESCRIPTION: Draws a green rectangle at (172, 140) with width 85 and height 27.
; PLAN: r0=172(x), r1=140(y), r2=85(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 140
LDI r2, 85
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
