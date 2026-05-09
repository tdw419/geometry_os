; DESCRIPTION: Creates a green rectangular region at (212, 119) spanning 87 by 102 pixels.
; PLAN: r0=212(x), r1=119(y), r2=87(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 119
LDI r2, 87
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
