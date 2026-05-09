; DESCRIPTION: Creates a magenta rectangular region at (335, 103) spanning 19 by 97 pixels.
; PLAN: r0=335(x), r1=103(y), r2=19(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 103
LDI r2, 19
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
