; DESCRIPTION: Creates a magenta rectangular region at (7, 110) spanning 75 by 34 pixels.
; PLAN: r0=7(x), r1=110(y), r2=75(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 110
LDI r2, 75
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
