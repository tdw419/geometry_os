; DESCRIPTION: Creates a yellow rectangular region at (4, 110) spanning 23 by 94 pixels.
; PLAN: r0=4(x), r1=110(y), r2=23(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 110
LDI r2, 23
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
