; DESCRIPTION: Creates a yellow rectangular region at (192, 241) spanning 29 by 10 pixels.
; PLAN: r0=192(x), r1=241(y), r2=29(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 241
LDI r2, 29
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
