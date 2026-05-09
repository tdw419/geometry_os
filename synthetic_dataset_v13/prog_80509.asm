; DESCRIPTION: Draws a magenta rectangle at (130, 156) with width 14 and height 12.
; PLAN: r0=130(x), r1=156(y), r2=14(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 156
LDI r2, 14
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
