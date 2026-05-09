; DESCRIPTION: Draws a magenta rectangle at (7, 179) with width 110 and height 16.
; PLAN: r0=7(x), r1=179(y), r2=110(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 179
LDI r2, 110
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
