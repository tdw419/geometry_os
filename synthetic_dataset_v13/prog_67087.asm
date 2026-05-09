; DESCRIPTION: Creates a black rectangular region at (201, 192) spanning 120 by 11 pixels.
; PLAN: r0=201(x), r1=192(y), r2=120(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 192
LDI r2, 120
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
