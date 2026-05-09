; DESCRIPTION: Draws a magenta rectangle at (237, 9) with width 51 and height 97.
; PLAN: r0=237(x), r1=9(y), r2=51(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 9
LDI r2, 51
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
