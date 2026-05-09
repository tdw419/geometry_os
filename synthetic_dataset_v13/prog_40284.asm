; DESCRIPTION: Draws a magenta rectangle at (265, 189) with width 21 and height 17.
; PLAN: r0=265(x), r1=189(y), r2=21(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 189
LDI r2, 21
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
