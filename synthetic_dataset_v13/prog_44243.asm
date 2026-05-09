; DESCRIPTION: Draws a magenta rectangle at (27, 106) with width 92 and height 93.
; PLAN: r0=27(x), r1=106(y), r2=92(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 106
LDI r2, 92
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
