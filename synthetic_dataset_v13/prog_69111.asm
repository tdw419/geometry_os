; DESCRIPTION: Creates a green rectangular region at (30, 170) spanning 29 by 46 pixels.
; PLAN: r0=30(x), r1=170(y), r2=29(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 170
LDI r2, 29
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
