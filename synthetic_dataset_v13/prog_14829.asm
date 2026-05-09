; DESCRIPTION: Draws a magenta rectangle at (99, 74) with width 117 and height 93.
; PLAN: r0=99(x), r1=74(y), r2=117(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 74
LDI r2, 117
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
