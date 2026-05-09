; DESCRIPTION: Creates a black rectangular region at (14, 148) spanning 78 by 101 pixels.
; PLAN: r0=14(x), r1=148(y), r2=78(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 148
LDI r2, 78
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
