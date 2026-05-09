; DESCRIPTION: Creates a black rectangular region at (331, 141) spanning 100 by 34 pixels.
; PLAN: r0=331(x), r1=141(y), r2=100(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 141
LDI r2, 100
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
