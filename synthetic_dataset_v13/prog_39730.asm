; DESCRIPTION: Creates a magenta rectangular region at (106, 34) spanning 85 by 100 pixels.
; PLAN: r0=106(x), r1=34(y), r2=85(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 34
LDI r2, 85
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
