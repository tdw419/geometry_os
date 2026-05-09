; DESCRIPTION: Creates a white rectangular region at (380, 123) spanning 31 by 88 pixels.
; PLAN: r0=380(x), r1=123(y), r2=31(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 123
LDI r2, 31
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
