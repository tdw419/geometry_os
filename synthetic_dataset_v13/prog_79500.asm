; DESCRIPTION: Draws a magenta rectangle at (223, 151) with width 52 and height 43.
; PLAN: r0=223(x), r1=151(y), r2=52(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 151
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
