; DESCRIPTION: Draws a magenta rectangle at (373, 34) with width 38 and height 36.
; PLAN: r0=373(x), r1=34(y), r2=38(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 34
LDI r2, 38
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
