; DESCRIPTION: Creates a magenta rectangular region at (77, 64) spanning 74 by 89 pixels.
; PLAN: r0=77(x), r1=64(y), r2=74(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 64
LDI r2, 74
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
