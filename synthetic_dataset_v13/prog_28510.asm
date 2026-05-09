; DESCRIPTION: Creates a black rectangular region at (419, 60) spanning 58 by 78 pixels.
; PLAN: r0=419(x), r1=60(y), r2=58(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 60
LDI r2, 58
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
