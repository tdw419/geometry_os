; DESCRIPTION: Creates a purple rectangular region at (301, 51) spanning 102 by 71 pixels.
; PLAN: r0=301(x), r1=51(y), r2=102(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 51
LDI r2, 102
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
