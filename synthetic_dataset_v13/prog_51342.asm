; DESCRIPTION: Creates a magenta rectangular region at (133, 34) spanning 38 by 75 pixels.
; PLAN: r0=133(x), r1=34(y), r2=38(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 34
LDI r2, 38
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
