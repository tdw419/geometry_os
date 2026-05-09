; DESCRIPTION: Creates a purple rectangular region at (245, 56) spanning 115 by 119 pixels.
; PLAN: r0=245(x), r1=56(y), r2=115(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 56
LDI r2, 115
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
