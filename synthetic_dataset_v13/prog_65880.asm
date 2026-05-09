; DESCRIPTION: Draws a magenta rectangle at (298, 73) with width 20 and height 106.
; PLAN: r0=298(x), r1=73(y), r2=20(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 73
LDI r2, 20
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
