; DESCRIPTION: Draws a magenta rectangle at (143, 93) with width 69 and height 110.
; PLAN: r0=143(x), r1=93(y), r2=69(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 93
LDI r2, 69
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
