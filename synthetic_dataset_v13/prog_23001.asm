; DESCRIPTION: Draws a magenta rectangle at (189, 17) with width 62 and height 18.
; PLAN: r0=189(x), r1=17(y), r2=62(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 17
LDI r2, 62
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
