; DESCRIPTION: Creates a magenta rectangular region at (103, 149) spanning 110 by 49 pixels.
; PLAN: r0=103(x), r1=149(y), r2=110(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 149
LDI r2, 110
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
