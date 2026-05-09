; DESCRIPTION: Draws a magenta rectangle at (411, 164) with width 89 and height 87.
; PLAN: r0=411(x), r1=164(y), r2=89(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 164
LDI r2, 89
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
