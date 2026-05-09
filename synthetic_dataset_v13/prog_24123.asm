; DESCRIPTION: Draws a white rectangle at (144, 156) with width 87 and height 40.
; PLAN: r0=144(x), r1=156(y), r2=87(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 156
LDI r2, 87
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
