; DESCRIPTION: Creates a magenta rectangular region at (441, 10) spanning 19 by 31 pixels.
; PLAN: r0=441(x), r1=10(y), r2=19(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 10
LDI r2, 19
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
