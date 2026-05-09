; DESCRIPTION: Creates a green rectangular region at (278, 83) spanning 94 by 22 pixels.
; PLAN: r0=278(x), r1=83(y), r2=94(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 83
LDI r2, 94
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
