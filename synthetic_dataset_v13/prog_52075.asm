; DESCRIPTION: Creates a purple rectangular region at (458, 53) spanning 51 by 112 pixels.
; PLAN: r0=458(x), r1=53(y), r2=51(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 53
LDI r2, 51
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
