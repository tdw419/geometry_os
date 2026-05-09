; DESCRIPTION: Creates a yellow rectangular region at (478, 40) spanning 19 by 115 pixels.
; PLAN: r0=478(x), r1=40(y), r2=19(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 40
LDI r2, 19
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
