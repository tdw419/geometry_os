; DESCRIPTION: Creates a magenta rectangular region at (325, 169) spanning 97 by 37 pixels.
; PLAN: r0=325(x), r1=169(y), r2=97(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 169
LDI r2, 97
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
