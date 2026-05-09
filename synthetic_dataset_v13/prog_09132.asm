; DESCRIPTION: Creates a magenta rectangular region at (192, 156) spanning 79 by 99 pixels.
; PLAN: r0=192(x), r1=156(y), r2=79(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 156
LDI r2, 79
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
