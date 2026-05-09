; DESCRIPTION: Creates a green rectangular region at (395, 170) spanning 51 by 68 pixels.
; PLAN: r0=395(x), r1=170(y), r2=51(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 170
LDI r2, 51
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
