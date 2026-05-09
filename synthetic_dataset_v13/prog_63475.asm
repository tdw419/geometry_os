; DESCRIPTION: Creates a purple rectangular region at (289, 89) spanning 56 by 100 pixels.
; PLAN: r0=289(x), r1=89(y), r2=56(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 89
LDI r2, 56
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
