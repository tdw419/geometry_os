; DESCRIPTION: Creates a magenta rectangular region at (399, 34) spanning 85 by 116 pixels.
; PLAN: r0=399(x), r1=34(y), r2=85(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 34
LDI r2, 85
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
