; DESCRIPTION: Creates a green rectangular region at (363, 20) spanning 75 by 13 pixels.
; PLAN: r0=363(x), r1=20(y), r2=75(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 20
LDI r2, 75
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
