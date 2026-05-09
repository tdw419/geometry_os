; DESCRIPTION: Creates a white rectangular region at (88, 193) spanning 31 by 43 pixels.
; PLAN: r0=88(x), r1=193(y), r2=31(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 193
LDI r2, 31
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
