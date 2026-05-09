; DESCRIPTION: Creates a magenta rectangular region at (231, 145) spanning 110 by 91 pixels.
; PLAN: r0=231(x), r1=145(y), r2=110(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 145
LDI r2, 110
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
