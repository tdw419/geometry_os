; DESCRIPTION: Creates a black rectangular region at (142, 20) spanning 78 by 66 pixels.
; PLAN: r0=142(x), r1=20(y), r2=78(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 20
LDI r2, 78
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
