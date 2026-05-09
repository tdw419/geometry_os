; DESCRIPTION: Creates a black rectangular region at (382, 119) spanning 106 by 57 pixels.
; PLAN: r0=382(x), r1=119(y), r2=106(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 119
LDI r2, 106
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
