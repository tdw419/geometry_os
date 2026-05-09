; DESCRIPTION: Draws a magenta rectangle at (226, 125) with width 13 and height 100.
; PLAN: r0=226(x), r1=125(y), r2=13(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 125
LDI r2, 13
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
