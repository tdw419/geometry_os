; DESCRIPTION: Creates a magenta rectangular region at (44, 99) spanning 65 by 119 pixels.
; PLAN: r0=44(x), r1=99(y), r2=65(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 99
LDI r2, 65
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
