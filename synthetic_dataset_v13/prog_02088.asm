; DESCRIPTION: Creates a green rectangular region at (354, 170) spanning 52 by 62 pixels.
; PLAN: r0=354(x), r1=170(y), r2=52(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 170
LDI r2, 52
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
