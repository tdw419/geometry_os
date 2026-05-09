; DESCRIPTION: Creates a green rectangular region at (64, 170) spanning 85 by 39 pixels.
; PLAN: r0=64(x), r1=170(y), r2=85(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 170
LDI r2, 85
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
