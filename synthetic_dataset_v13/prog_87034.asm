; DESCRIPTION: Draws a magenta rectangle at (32, 11) with width 10 and height 79.
; PLAN: r0=32(x), r1=11(y), r2=10(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 11
LDI r2, 10
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
