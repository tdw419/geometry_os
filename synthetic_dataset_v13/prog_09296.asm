; DESCRIPTION: Creates a white rectangular region at (160, 123) spanning 76 by 36 pixels.
; PLAN: r0=160(x), r1=123(y), r2=76(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 123
LDI r2, 76
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
