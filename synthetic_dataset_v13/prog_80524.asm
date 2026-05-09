; DESCRIPTION: Draws a black rectangle at (151, 156) with width 83 and height 65.
; PLAN: r0=151(x), r1=156(y), r2=83(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 156
LDI r2, 83
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
