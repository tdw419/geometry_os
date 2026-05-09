; DESCRIPTION: Creates a black rectangular region at (47, 0) spanning 83 by 58 pixels.
; PLAN: r0=47(x), r1=0(y), r2=83(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 0
LDI r2, 83
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
