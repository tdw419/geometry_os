; DESCRIPTION: Creates a black rectangular region at (388, 122) spanning 37 by 115 pixels.
; PLAN: r0=388(x), r1=122(y), r2=37(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 122
LDI r2, 37
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
