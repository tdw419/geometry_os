; DESCRIPTION: Draws a magenta rectangle at (444, 112) with width 19 and height 31.
; PLAN: r0=444(x), r1=112(y), r2=19(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 112
LDI r2, 19
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
