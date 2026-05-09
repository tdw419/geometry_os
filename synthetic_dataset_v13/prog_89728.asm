; DESCRIPTION: Creates a magenta rectangular region at (106, 149) spanning 21 by 49 pixels.
; PLAN: r0=106(x), r1=149(y), r2=21(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 149
LDI r2, 21
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
