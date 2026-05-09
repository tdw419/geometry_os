; DESCRIPTION: Creates a black rectangular region at (248, 124) spanning 61 by 15 pixels.
; PLAN: r0=248(x), r1=124(y), r2=61(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 124
LDI r2, 61
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
