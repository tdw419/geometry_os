; DESCRIPTION: Creates a purple rectangular region at (381, 17) spanning 119 by 100 pixels.
; PLAN: r0=381(x), r1=17(y), r2=119(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 17
LDI r2, 119
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
