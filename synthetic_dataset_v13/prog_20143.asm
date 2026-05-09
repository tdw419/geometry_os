; DESCRIPTION: Draws a magenta rectangle at (358, 39) with width 89 and height 46.
; PLAN: r0=358(x), r1=39(y), r2=89(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 39
LDI r2, 89
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
