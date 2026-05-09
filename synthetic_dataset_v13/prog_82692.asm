; DESCRIPTION: Creates a white rectangular region at (31, 133) spanning 83 by 116 pixels.
; PLAN: r0=31(x), r1=133(y), r2=83(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 133
LDI r2, 83
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
