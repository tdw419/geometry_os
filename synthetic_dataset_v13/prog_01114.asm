; DESCRIPTION: Creates a yellow rectangular region at (366, 63) spanning 119 by 87 pixels.
; PLAN: r0=366(x), r1=63(y), r2=119(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 63
LDI r2, 119
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
