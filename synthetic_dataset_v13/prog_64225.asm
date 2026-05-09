; DESCRIPTION: Draws a green rectangle at (373, 156) with width 85 and height 71.
; PLAN: r0=373(x), r1=156(y), r2=85(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 156
LDI r2, 85
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
