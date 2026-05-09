; DESCRIPTION: Draws a magenta rectangle at (280, 17) with width 27 and height 51.
; PLAN: r0=280(x), r1=17(y), r2=27(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 17
LDI r2, 27
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
