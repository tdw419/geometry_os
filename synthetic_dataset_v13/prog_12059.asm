; DESCRIPTION: Draws a magenta rectangle at (193, 132) with width 96 and height 64.
; PLAN: r0=193(x), r1=132(y), r2=96(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 132
LDI r2, 96
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
