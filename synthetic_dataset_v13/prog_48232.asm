; DESCRIPTION: Creates a black rectangular region at (0, 78) spanning 31 by 84 pixels.
; PLAN: r0=0(x), r1=78(y), r2=31(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 78
LDI r2, 31
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
