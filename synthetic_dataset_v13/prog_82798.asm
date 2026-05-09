; DESCRIPTION: Creates a magenta rectangular region at (414, 77) spanning 71 by 66 pixels.
; PLAN: r0=414(x), r1=77(y), r2=71(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 77
LDI r2, 71
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
