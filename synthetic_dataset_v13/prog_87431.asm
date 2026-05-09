; DESCRIPTION: Creates a green rectangular region at (363, 3) spanning 62 by 75 pixels.
; PLAN: r0=363(x), r1=3(y), r2=62(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 3
LDI r2, 62
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
