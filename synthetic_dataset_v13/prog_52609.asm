; DESCRIPTION: Creates a white rectangular region at (76, 133) spanning 100 by 31 pixels.
; PLAN: r0=76(x), r1=133(y), r2=100(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 133
LDI r2, 100
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
