; DESCRIPTION: Creates a magenta rectangular region at (247, 52) spanning 110 by 106 pixels.
; PLAN: r0=247(x), r1=52(y), r2=110(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 52
LDI r2, 110
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
