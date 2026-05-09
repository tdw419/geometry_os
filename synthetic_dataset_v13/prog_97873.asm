; DESCRIPTION: Draws a magenta rectangle at (285, 48) with width 18 and height 106.
; PLAN: r0=285(x), r1=48(y), r2=18(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 48
LDI r2, 18
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
