; DESCRIPTION: Creates a yellow rectangular region at (373, 49) spanning 106 by 43 pixels.
; PLAN: r0=373(x), r1=49(y), r2=106(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 49
LDI r2, 106
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
