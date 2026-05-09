; DESCRIPTION: Draws a magenta rectangle at (359, 81) with width 42 and height 74.
; PLAN: r0=359(x), r1=81(y), r2=42(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 81
LDI r2, 42
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
