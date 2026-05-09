; DESCRIPTION: Creates a magenta rectangular region at (415, 23) spanning 77 by 89 pixels.
; PLAN: r0=415(x), r1=23(y), r2=77(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 23
LDI r2, 77
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
