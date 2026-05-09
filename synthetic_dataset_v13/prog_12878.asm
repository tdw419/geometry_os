; DESCRIPTION: Creates a magenta rectangular region at (137, 118) spanning 96 by 106 pixels.
; PLAN: r0=137(x), r1=118(y), r2=96(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 118
LDI r2, 96
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
