; DESCRIPTION: Draws a magenta rectangle at (179, 180) with width 66 and height 70.
; PLAN: r0=179(x), r1=180(y), r2=66(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 180
LDI r2, 66
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
