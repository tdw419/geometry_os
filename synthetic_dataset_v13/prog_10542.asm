; DESCRIPTION: Creates a white rectangular region at (381, 101) spanning 108 by 106 pixels.
; PLAN: r0=381(x), r1=101(y), r2=108(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 101
LDI r2, 108
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
