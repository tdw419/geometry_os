; DESCRIPTION: Creates a black rectangular region at (314, 141) spanning 79 by 69 pixels.
; PLAN: r0=314(x), r1=141(y), r2=79(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 141
LDI r2, 79
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
