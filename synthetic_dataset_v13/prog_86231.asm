; DESCRIPTION: Draws a magenta rectangle at (47, 27) with width 11 and height 115.
; PLAN: r0=47(x), r1=27(y), r2=11(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 27
LDI r2, 11
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
