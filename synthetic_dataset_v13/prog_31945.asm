; DESCRIPTION: Creates a black rectangular region at (325, 148) spanning 75 by 104 pixels.
; PLAN: r0=325(x), r1=148(y), r2=75(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 148
LDI r2, 75
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
