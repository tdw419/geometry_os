; DESCRIPTION: Creates a yellow rectangular region at (441, 100) spanning 14 by 94 pixels.
; PLAN: r0=441(x), r1=100(y), r2=14(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 100
LDI r2, 14
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
