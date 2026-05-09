; DESCRIPTION: Draws a magenta rectangle at (427, 160) with width 51 and height 86.
; PLAN: r0=427(x), r1=160(y), r2=51(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 160
LDI r2, 51
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
