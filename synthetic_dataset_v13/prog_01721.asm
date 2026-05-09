; DESCRIPTION: Draws a magenta rectangle at (51, 149) with width 102 and height 18.
; PLAN: r0=51(x), r1=149(y), r2=102(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 149
LDI r2, 102
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
