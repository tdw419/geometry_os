; DESCRIPTION: Creates a magenta rectangular region at (179, 156) spanning 19 by 23 pixels.
; PLAN: r0=179(x), r1=156(y), r2=19(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 156
LDI r2, 19
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
