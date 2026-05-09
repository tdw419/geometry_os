; DESCRIPTION: Creates a magenta rectangular region at (4, 115) spanning 85 by 31 pixels.
; PLAN: r0=4(x), r1=115(y), r2=85(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 115
LDI r2, 85
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
