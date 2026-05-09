; DESCRIPTION: Creates a black rectangular region at (340, 124) spanning 62 by 84 pixels.
; PLAN: r0=340(x), r1=124(y), r2=62(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 124
LDI r2, 62
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
