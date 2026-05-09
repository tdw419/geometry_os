; DESCRIPTION: Creates a black rectangular region at (312, 0) spanning 99 by 84 pixels.
; PLAN: r0=312(x), r1=0(y), r2=99(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 0
LDI r2, 99
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
