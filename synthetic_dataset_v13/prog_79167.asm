; DESCRIPTION: Creates a magenta rectangular region at (371, 169) spanning 75 by 78 pixels.
; PLAN: r0=371(x), r1=169(y), r2=75(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 169
LDI r2, 75
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
