; DESCRIPTION: Draws a magenta rectangle at (431, 42) with width 17 and height 17.
; PLAN: r0=431(x), r1=42(y), r2=17(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 42
LDI r2, 17
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
