; DESCRIPTION: Draws a magenta rectangle at (115, 9) with width 71 and height 95.
; PLAN: r0=115(x), r1=9(y), r2=71(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 9
LDI r2, 71
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
