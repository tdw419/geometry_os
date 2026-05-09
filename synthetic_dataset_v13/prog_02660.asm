; DESCRIPTION: Draws a magenta rectangle at (175, 86) with width 51 and height 48.
; PLAN: r0=175(x), r1=86(y), r2=51(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 86
LDI r2, 51
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
