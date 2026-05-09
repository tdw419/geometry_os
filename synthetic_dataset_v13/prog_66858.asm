; DESCRIPTION: Creates a green rectangular region at (192, 170) spanning 37 by 70 pixels.
; PLAN: r0=192(x), r1=170(y), r2=37(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 170
LDI r2, 37
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
