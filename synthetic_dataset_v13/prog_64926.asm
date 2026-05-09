; DESCRIPTION: Draws a magenta rectangle at (289, 92) with width 33 and height 84.
; PLAN: r0=289(x), r1=92(y), r2=33(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 92
LDI r2, 33
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
