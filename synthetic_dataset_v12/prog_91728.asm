; DESCRIPTION: Creates a black rectangular region at (14, 119) spanning 82 by 96 pixels.
; PLAN: r0=14(x), r1=119(y), r2=82(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 119
LDI r2, 82
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
