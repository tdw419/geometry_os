; DESCRIPTION: Creates a magenta rectangular region at (185, 110) spanning 31 by 95 pixels.
; PLAN: r0=185(x), r1=110(y), r2=31(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 110
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
