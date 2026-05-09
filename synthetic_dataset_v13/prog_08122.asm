; DESCRIPTION: Creates a magenta rectangular region at (357, 108) spanning 44 by 105 pixels.
; PLAN: r0=357(x), r1=108(y), r2=44(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 108
LDI r2, 44
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
