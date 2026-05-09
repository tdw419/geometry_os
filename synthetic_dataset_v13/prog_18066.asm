; DESCRIPTION: Draws a magenta rectangle at (11, 42) with width 118 and height 33.
; PLAN: r0=11(x), r1=42(y), r2=118(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 42
LDI r2, 118
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
