; DESCRIPTION: Creates a black rectangular region at (47, 9) spanning 31 by 115 pixels.
; PLAN: r0=47(x), r1=9(y), r2=31(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 9
LDI r2, 31
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
