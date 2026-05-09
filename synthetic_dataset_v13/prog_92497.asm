; DESCRIPTION: Draws a magenta rectangle at (300, 168) with width 99 and height 81.
; PLAN: r0=300(x), r1=168(y), r2=99(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 168
LDI r2, 99
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
