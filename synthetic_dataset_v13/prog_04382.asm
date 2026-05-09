; DESCRIPTION: Creates a purple rectangular region at (458, 137) spanning 12 by 73 pixels.
; PLAN: r0=458(x), r1=137(y), r2=12(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 137
LDI r2, 12
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
