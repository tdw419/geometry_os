; DESCRIPTION: Creates a black rectangular region at (477, 29) spanning 25 by 78 pixels.
; PLAN: r0=477(x), r1=29(y), r2=25(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 29
LDI r2, 25
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
