; DESCRIPTION: Creates a magenta rectangular region at (395, 156) spanning 24 by 63 pixels.
; PLAN: r0=395(x), r1=156(y), r2=24(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 156
LDI r2, 24
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
