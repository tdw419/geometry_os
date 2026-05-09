; DESCRIPTION: Creates a magenta rectangular region at (317, 66) spanning 77 by 71 pixels.
; PLAN: r0=317(x), r1=66(y), r2=77(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 66
LDI r2, 77
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
