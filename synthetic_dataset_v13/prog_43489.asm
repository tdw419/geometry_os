; DESCRIPTION: Draws a magenta rectangle at (195, 16) with width 75 and height 70.
; PLAN: r0=195(x), r1=16(y), r2=75(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 16
LDI r2, 75
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
