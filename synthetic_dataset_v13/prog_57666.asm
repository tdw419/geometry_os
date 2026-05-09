; DESCRIPTION: Draws a magenta rectangle at (444, 7) with width 39 and height 73.
; PLAN: r0=444(x), r1=7(y), r2=39(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 7
LDI r2, 39
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
