; DESCRIPTION: Creates a yellow rectangular region at (319, 102) spanning 102 by 83 pixels.
; PLAN: r0=319(x), r1=102(y), r2=102(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 102
LDI r2, 102
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
