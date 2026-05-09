; DESCRIPTION: Draws a magenta rectangle at (361, 33) with width 84 and height 112.
; PLAN: r0=361(x), r1=33(y), r2=84(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 33
LDI r2, 84
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
