; DESCRIPTION: Creates a yellow rectangular region at (192, 18) spanning 106 by 55 pixels.
; PLAN: r0=192(x), r1=18(y), r2=106(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 18
LDI r2, 106
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
