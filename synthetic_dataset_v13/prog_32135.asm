; DESCRIPTION: Creates a magenta rectangular region at (357, 158) spanning 44 by 77 pixels.
; PLAN: r0=357(x), r1=158(y), r2=44(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 158
LDI r2, 44
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
