; DESCRIPTION: Draws a magenta rectangle at (249, 164) with width 106 and height 16.
; PLAN: r0=249(x), r1=164(y), r2=106(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 164
LDI r2, 106
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
