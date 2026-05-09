; DESCRIPTION: Creates a black rectangular region at (422, 29) spanning 77 by 84 pixels.
; PLAN: r0=422(x), r1=29(y), r2=77(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 29
LDI r2, 77
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
