; DESCRIPTION: Creates a green rectangular region at (177, 26) spanning 56 by 22 pixels.
; PLAN: r0=177(x), r1=26(y), r2=56(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 26
LDI r2, 56
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
