; DESCRIPTION: Creates a magenta rectangular region at (314, 179) spanning 31 by 31 pixels.
; PLAN: r0=314(x), r1=179(y), r2=31(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 179
LDI r2, 31
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
