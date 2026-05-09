; DESCRIPTION: Creates a black rectangular region at (114, 20) spanning 119 by 31 pixels.
; PLAN: r0=114(x), r1=20(y), r2=119(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 20
LDI r2, 119
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
