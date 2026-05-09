; DESCRIPTION: Draws a magenta rectangle at (149, 92) with width 37 and height 16.
; PLAN: r0=149(x), r1=92(y), r2=37(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 92
LDI r2, 37
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
