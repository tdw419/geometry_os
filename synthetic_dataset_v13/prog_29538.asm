; DESCRIPTION: Draws a magenta rectangle at (250, 70) with width 70 and height 45.
; PLAN: r0=250(x), r1=70(y), r2=70(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 70
LDI r2, 70
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
