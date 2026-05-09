; DESCRIPTION: Draws a magenta rectangle at (436, 150) with width 51 and height 105.
; PLAN: r0=436(x), r1=150(y), r2=51(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 150
LDI r2, 51
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
