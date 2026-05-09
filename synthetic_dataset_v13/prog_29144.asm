; DESCRIPTION: Creates a green rectangular region at (147, 14) spanning 102 by 56 pixels.
; PLAN: r0=147(x), r1=14(y), r2=102(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 14
LDI r2, 102
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
