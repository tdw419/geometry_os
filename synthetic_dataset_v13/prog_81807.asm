; DESCRIPTION: Draws a magenta rectangle at (108, 89) with width 21 and height 64.
; PLAN: r0=108(x), r1=89(y), r2=21(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 89
LDI r2, 21
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
