; DESCRIPTION: Draws a magenta rectangle at (315, 51) with width 109 and height 78.
; PLAN: r0=315(x), r1=51(y), r2=109(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 51
LDI r2, 109
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
