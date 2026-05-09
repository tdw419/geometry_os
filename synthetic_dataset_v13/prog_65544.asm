; DESCRIPTION: Creates a magenta rectangular region at (311, 115) spanning 66 by 58 pixels.
; PLAN: r0=311(x), r1=115(y), r2=66(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 115
LDI r2, 66
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
