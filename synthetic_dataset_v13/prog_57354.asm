; DESCRIPTION: Creates a yellow rectangular region at (364, 192) spanning 99 by 51 pixels.
; PLAN: r0=364(x), r1=192(y), r2=99(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 192
LDI r2, 99
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
