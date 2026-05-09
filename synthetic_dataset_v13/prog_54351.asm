; DESCRIPTION: Draws a magenta rectangle at (201, 93) with width 84 and height 60.
; PLAN: r0=201(x), r1=93(y), r2=84(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 93
LDI r2, 84
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
