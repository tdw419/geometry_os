; DESCRIPTION: Draws a magenta rectangle at (243, 51) with width 44 and height 60.
; PLAN: r0=243(x), r1=51(y), r2=44(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 51
LDI r2, 44
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
