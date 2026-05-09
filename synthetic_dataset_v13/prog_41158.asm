; DESCRIPTION: Creates a magenta rectangular region at (387, 183) spanning 77 by 56 pixels.
; PLAN: r0=387(x), r1=183(y), r2=77(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 183
LDI r2, 77
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
