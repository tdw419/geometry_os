; DESCRIPTION: Draws a magenta rectangle at (362, 229) with width 31 and height 22.
; PLAN: r0=362(x), r1=229(y), r2=31(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 229
LDI r2, 31
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
