; DESCRIPTION: Creates a purple rectangular region at (458, 57) spanning 46 by 64 pixels.
; PLAN: r0=458(x), r1=57(y), r2=46(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 57
LDI r2, 46
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
