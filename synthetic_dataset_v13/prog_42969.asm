; DESCRIPTION: Creates a magenta rectangular region at (444, 66) spanning 10 by 81 pixels.
; PLAN: r0=444(x), r1=66(y), r2=10(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 66
LDI r2, 10
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
