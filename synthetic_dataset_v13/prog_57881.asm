; DESCRIPTION: Creates a magenta rectangular region at (52, 34) spanning 110 by 45 pixels.
; PLAN: r0=52(x), r1=34(y), r2=110(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 34
LDI r2, 110
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
