; DESCRIPTION: Creates a black rectangular region at (321, 21) spanning 67 by 119 pixels.
; PLAN: r0=321(x), r1=21(y), r2=67(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 21
LDI r2, 67
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
