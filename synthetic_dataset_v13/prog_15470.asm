; DESCRIPTION: Creates a black rectangular region at (102, 30) spanning 10 by 104 pixels.
; PLAN: r0=102(x), r1=30(y), r2=10(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 30
LDI r2, 10
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
