; DESCRIPTION: Creates a white rectangular region at (378, 55) spanning 106 by 58 pixels.
; PLAN: r0=378(x), r1=55(y), r2=106(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 55
LDI r2, 106
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
