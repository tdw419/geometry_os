; DESCRIPTION: Creates a black rectangular region at (373, 89) spanning 62 by 17 pixels.
; PLAN: r0=373(x), r1=89(y), r2=62(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 89
LDI r2, 62
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
