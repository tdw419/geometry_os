; DESCRIPTION: Draws a green rectangle at (27, 156) with width 116 and height 90.
; PLAN: r0=27(x), r1=156(y), r2=116(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 156
LDI r2, 116
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
