; DESCRIPTION: Creates a magenta rectangular region at (183, 66) spanning 22 by 94 pixels.
; PLAN: r0=183(x), r1=66(y), r2=22(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 66
LDI r2, 22
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
