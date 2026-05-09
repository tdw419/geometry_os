; DESCRIPTION: Creates a green rectangular region at (147, 16) spanning 37 by 31 pixels.
; PLAN: r0=147(x), r1=16(y), r2=37(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 16
LDI r2, 37
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
