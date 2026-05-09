; DESCRIPTION: Draws a magenta rectangle at (27, 162) with width 52 and height 51.
; PLAN: r0=27(x), r1=162(y), r2=52(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 162
LDI r2, 52
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
