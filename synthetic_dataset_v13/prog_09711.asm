; DESCRIPTION: Draws a magenta rectangle at (220, 95) with width 34 and height 120.
; PLAN: r0=220(x), r1=95(y), r2=34(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 95
LDI r2, 34
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
