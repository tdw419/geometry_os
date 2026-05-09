; DESCRIPTION: Draws a magenta rectangle at (265, 218) with width 77 and height 31.
; PLAN: r0=265(x), r1=218(y), r2=77(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 218
LDI r2, 77
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
