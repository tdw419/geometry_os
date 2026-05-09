; DESCRIPTION: Creates a magenta rectangular region at (143, 34) spanning 96 by 22 pixels.
; PLAN: r0=143(x), r1=34(y), r2=96(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 34
LDI r2, 96
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
