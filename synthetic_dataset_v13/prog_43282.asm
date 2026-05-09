; DESCRIPTION: Creates a yellow rectangular region at (87, 90) spanning 97 by 106 pixels.
; PLAN: r0=87(x), r1=90(y), r2=97(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 90
LDI r2, 97
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
