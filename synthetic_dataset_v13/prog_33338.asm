; DESCRIPTION: Creates a black rectangular region at (143, 100) spanning 104 by 106 pixels.
; PLAN: r0=143(x), r1=100(y), r2=104(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 100
LDI r2, 104
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
