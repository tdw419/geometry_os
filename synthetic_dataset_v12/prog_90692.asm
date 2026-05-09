; DESCRIPTION: Creates a black rectangular region at (422, 216) spanning 75 by 33 pixels.
; PLAN: r0=422(x), r1=216(y), r2=75(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 216
LDI r2, 75
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
