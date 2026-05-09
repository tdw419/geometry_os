; DESCRIPTION: Creates a magenta rectangular region at (34, 199) spanning 116 by 18 pixels.
; PLAN: r0=34(x), r1=199(y), r2=116(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 199
LDI r2, 116
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
