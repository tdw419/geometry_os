; DESCRIPTION: Draws a magenta rectangle at (47, 42) with width 20 and height 97.
; PLAN: r0=47(x), r1=42(y), r2=20(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 42
LDI r2, 20
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
