; DESCRIPTION: Creates a magenta rectangular region at (155, 110) spanning 42 by 89 pixels.
; PLAN: r0=155(x), r1=110(y), r2=42(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 110
LDI r2, 42
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
