; DESCRIPTION: Draws a magenta rectangle at (484, 120) with width 14 and height 85.
; PLAN: r0=484(x), r1=120(y), r2=14(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 120
LDI r2, 14
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
