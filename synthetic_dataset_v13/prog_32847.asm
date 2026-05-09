; DESCRIPTION: Draws a magenta rectangle at (165, 23) with width 81 and height 57.
; PLAN: r0=165(x), r1=23(y), r2=81(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 23
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
