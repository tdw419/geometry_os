; DESCRIPTION: Creates a magenta rectangular region at (26, 115) spanning 63 by 31 pixels.
; PLAN: r0=26(x), r1=115(y), r2=63(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 115
LDI r2, 63
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
