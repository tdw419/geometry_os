; DESCRIPTION: Creates a black rectangular region at (129, 76) spanning 55 by 60 pixels.
; PLAN: r0=129(x), r1=76(y), r2=55(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 55
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
