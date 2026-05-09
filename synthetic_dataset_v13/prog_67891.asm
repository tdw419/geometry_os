; DESCRIPTION: Creates a yellow rectangular region at (332, 46) spanning 102 by 97 pixels.
; PLAN: r0=332(x), r1=46(y), r2=102(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 46
LDI r2, 102
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
