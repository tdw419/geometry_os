; DESCRIPTION: Creates a magenta rectangular region at (14, 31) spanning 14 by 115 pixels.
; PLAN: r0=14(x), r1=31(y), r2=14(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 31
LDI r2, 14
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
