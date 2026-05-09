; DESCRIPTION: Creates a magenta rectangular region at (145, 1) spanning 107 by 57 pixels.
; PLAN: r0=145(x), r1=1(y), r2=107(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 1
LDI r2, 107
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
