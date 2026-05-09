; DESCRIPTION: Draws a magenta rectangle at (398, 179) with width 85 and height 66.
; PLAN: r0=398(x), r1=179(y), r2=85(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 179
LDI r2, 85
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
