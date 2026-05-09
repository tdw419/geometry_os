; DESCRIPTION: Creates a purple rectangular region at (289, 153) spanning 79 by 62 pixels.
; PLAN: r0=289(x), r1=153(y), r2=79(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 153
LDI r2, 79
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
