; DESCRIPTION: Creates a black rectangular region at (248, 19) spanning 49 by 21 pixels.
; PLAN: r0=248(x), r1=19(y), r2=49(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 19
LDI r2, 49
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
