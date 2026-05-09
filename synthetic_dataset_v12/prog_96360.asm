; DESCRIPTION: Draws a magenta rectangle at (275, 137) with width 64 and height 97.
; PLAN: r0=275(x), r1=137(y), r2=64(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 137
LDI r2, 64
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
