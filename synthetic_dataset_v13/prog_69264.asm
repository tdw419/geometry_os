; DESCRIPTION: Draws a magenta rectangle at (188, 187) with width 18 and height 51.
; PLAN: r0=188(x), r1=187(y), r2=18(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 187
LDI r2, 18
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
