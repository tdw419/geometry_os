; DESCRIPTION: Creates a red rectangular region at (429, 89) spanning 57 by 112 pixels.
; PLAN: r0=429(x), r1=89(y), r2=57(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 89
LDI r2, 57
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
