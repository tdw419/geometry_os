; DESCRIPTION: Creates a green rectangular region at (83, 118) spanning 83 by 24 pixels.
; PLAN: r0=83(x), r1=118(y), r2=83(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 118
LDI r2, 83
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
