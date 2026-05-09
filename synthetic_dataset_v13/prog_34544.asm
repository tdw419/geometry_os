; DESCRIPTION: Creates a green rectangular region at (66, 140) spanning 22 by 89 pixels.
; PLAN: r0=66(x), r1=140(y), r2=22(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 140
LDI r2, 22
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
