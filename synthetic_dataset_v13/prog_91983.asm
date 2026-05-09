; DESCRIPTION: Draws a magenta rectangle at (36, 63) with width 23 and height 107.
; PLAN: r0=36(x), r1=63(y), r2=23(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 63
LDI r2, 23
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
