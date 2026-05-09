; DESCRIPTION: Creates a magenta rectangular region at (238, 89) spanning 95 by 61 pixels.
; PLAN: r0=238(x), r1=89(y), r2=95(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 89
LDI r2, 95
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
