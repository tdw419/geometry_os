; DESCRIPTION: Draws a magenta rectangle at (181, 20) with width 93 and height 45.
; PLAN: r0=181(x), r1=20(y), r2=93(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 20
LDI r2, 93
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
