; DESCRIPTION: Creates a black rectangular region at (218, 100) spanning 34 by 69 pixels.
; PLAN: r0=218(x), r1=100(y), r2=34(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 100
LDI r2, 34
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
