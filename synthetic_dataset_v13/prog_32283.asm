; DESCRIPTION: Creates a magenta rectangular region at (218, 119) spanning 84 by 49 pixels.
; PLAN: r0=218(x), r1=119(y), r2=84(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 119
LDI r2, 84
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
