; DESCRIPTION: Creates a black rectangular region at (201, 52) spanning 82 by 110 pixels.
; PLAN: r0=201(x), r1=52(y), r2=82(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 52
LDI r2, 82
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
