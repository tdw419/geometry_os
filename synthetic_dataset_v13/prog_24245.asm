; DESCRIPTION: Creates a black rectangular region at (318, 87) spanning 17 by 48 pixels.
; PLAN: r0=318(x), r1=87(y), r2=17(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 87
LDI r2, 17
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
