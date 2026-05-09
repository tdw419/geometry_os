; DESCRIPTION: Creates a white rectangular region at (227, 155) spanning 76 by 99 pixels.
; PLAN: r0=227(x), r1=155(y), r2=76(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 155
LDI r2, 76
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
