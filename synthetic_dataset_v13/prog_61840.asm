; DESCRIPTION: Creates a magenta rectangular region at (392, 97) spanning 31 by 99 pixels.
; PLAN: r0=392(x), r1=97(y), r2=31(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 97
LDI r2, 31
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
