; DESCRIPTION: Draws a magenta rectangle at (447, 33) with width 12 and height 71.
; PLAN: r0=447(x), r1=33(y), r2=12(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 33
LDI r2, 12
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
