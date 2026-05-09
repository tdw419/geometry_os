; DESCRIPTION: Creates a black rectangular region at (407, 58) spanning 55 by 103 pixels.
; PLAN: r0=407(x), r1=58(y), r2=55(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 58
LDI r2, 55
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
