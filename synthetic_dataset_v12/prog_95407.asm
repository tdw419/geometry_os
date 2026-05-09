; DESCRIPTION: Draws a magenta rectangle at (231, 93) with width 74 and height 80.
; PLAN: r0=231(x), r1=93(y), r2=74(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 93
LDI r2, 74
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
