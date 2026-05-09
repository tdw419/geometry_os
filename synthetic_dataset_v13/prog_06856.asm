; DESCRIPTION: Draws a magenta rectangle at (193, 233) with width 13 and height 22.
; PLAN: r0=193(x), r1=233(y), r2=13(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 233
LDI r2, 13
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
