; DESCRIPTION: Creates a yellow rectangular region at (200, 179) spanning 99 by 66 pixels.
; PLAN: r0=200(x), r1=179(y), r2=99(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 179
LDI r2, 99
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
