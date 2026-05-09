; DESCRIPTION: Creates a yellow rectangular region at (357, 36) spanning 102 by 94 pixels.
; PLAN: r0=357(x), r1=36(y), r2=102(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 36
LDI r2, 102
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
