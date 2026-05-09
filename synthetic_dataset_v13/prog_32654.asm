; DESCRIPTION: Draws a magenta rectangle at (98, 93) with width 18 and height 89.
; PLAN: r0=98(x), r1=93(y), r2=18(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 93
LDI r2, 18
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
