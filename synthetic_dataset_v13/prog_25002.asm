; DESCRIPTION: Draws a magenta rectangle at (234, 75) with width 48 and height 37.
; PLAN: r0=234(x), r1=75(y), r2=48(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 75
LDI r2, 48
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
