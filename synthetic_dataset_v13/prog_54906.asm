; DESCRIPTION: Draws a green rectangle at (290, 156) with width 19 and height 28.
; PLAN: r0=290(x), r1=156(y), r2=19(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 156
LDI r2, 19
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
