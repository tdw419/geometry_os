; DESCRIPTION: Creates a yellow rectangular region at (297, 22) spanning 97 by 90 pixels.
; PLAN: r0=297(x), r1=22(y), r2=97(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 22
LDI r2, 97
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
