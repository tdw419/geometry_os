; DESCRIPTION: Creates a black rectangular region at (316, 85) spanning 44 by 110 pixels.
; PLAN: r0=316(x), r1=85(y), r2=44(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 85
LDI r2, 44
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
