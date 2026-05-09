; DESCRIPTION: Creates a green rectangular region at (312, 68) spanning 94 by 83 pixels.
; PLAN: r0=312(x), r1=68(y), r2=94(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 68
LDI r2, 94
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
