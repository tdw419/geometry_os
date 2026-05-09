; DESCRIPTION: Draws a magenta rectangle at (317, 70) with width 30 and height 115.
; PLAN: r0=317(x), r1=70(y), r2=30(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 70
LDI r2, 30
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
