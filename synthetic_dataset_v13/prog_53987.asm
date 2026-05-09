; DESCRIPTION: Creates a yellow rectangular region at (89, 90) spanning 63 by 106 pixels.
; PLAN: r0=89(x), r1=90(y), r2=63(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 90
LDI r2, 63
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
