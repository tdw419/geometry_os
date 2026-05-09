; DESCRIPTION: Creates a magenta rectangular region at (444, 81) spanning 34 by 43 pixels.
; PLAN: r0=444(x), r1=81(y), r2=34(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 81
LDI r2, 34
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
