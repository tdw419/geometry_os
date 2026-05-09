; DESCRIPTION: Creates a black rectangular region at (278, 156) spanning 29 by 84 pixels.
; PLAN: r0=278(x), r1=156(y), r2=29(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 156
LDI r2, 29
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
