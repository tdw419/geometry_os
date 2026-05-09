; DESCRIPTION: Draws a magenta rectangle at (226, 150) with width 80 and height 71.
; PLAN: r0=226(x), r1=150(y), r2=80(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 150
LDI r2, 80
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
