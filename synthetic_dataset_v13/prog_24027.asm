; DESCRIPTION: Creates a magenta rectangular region at (120, 162) spanning 31 by 71 pixels.
; PLAN: r0=120(x), r1=162(y), r2=31(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 162
LDI r2, 31
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
