; DESCRIPTION: Creates a magenta rectangular region at (335, 91) spanning 119 by 11 pixels.
; PLAN: r0=335(x), r1=91(y), r2=119(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 91
LDI r2, 119
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
