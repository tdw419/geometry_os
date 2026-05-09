; DESCRIPTION: Creates a black rectangular region at (382, 30) spanning 115 by 46 pixels.
; PLAN: r0=382(x), r1=30(y), r2=115(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 30
LDI r2, 115
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
