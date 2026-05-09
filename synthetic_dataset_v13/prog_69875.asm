; DESCRIPTION: Draws a magenta rectangle at (298, 145) with width 92 and height 75.
; PLAN: r0=298(x), r1=145(y), r2=92(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 145
LDI r2, 92
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
