; DESCRIPTION: Creates a white rectangular region at (321, 106) spanning 116 by 62 pixels.
; PLAN: r0=321(x), r1=106(y), r2=116(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 106
LDI r2, 116
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
