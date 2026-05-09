; DESCRIPTION: Draws a green rectangle at (163, 66) with width 27 and height 47.
; PLAN: r0=163(x), r1=66(y), r2=27(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 66
LDI r2, 27
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
