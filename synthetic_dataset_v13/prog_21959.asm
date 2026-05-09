; DESCRIPTION: Creates a black rectangular region at (316, 55) spanning 110 by 86 pixels.
; PLAN: r0=316(x), r1=55(y), r2=110(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 55
LDI r2, 110
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
