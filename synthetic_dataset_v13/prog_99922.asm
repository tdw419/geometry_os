; DESCRIPTION: Creates a black rectangular region at (409, 56) spanning 83 by 57 pixels.
; PLAN: r0=409(x), r1=56(y), r2=83(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 56
LDI r2, 83
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
