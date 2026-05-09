; DESCRIPTION: Creates a purple rectangular region at (496, 92) spanning 11 by 72 pixels.
; PLAN: r0=496(x), r1=92(y), r2=11(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 92
LDI r2, 11
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
