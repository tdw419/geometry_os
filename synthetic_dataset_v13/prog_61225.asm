; DESCRIPTION: Creates a purple rectangular region at (31, 26) spanning 19 by 19 pixels.
; PLAN: r0=31(x), r1=26(y), r2=19(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 26
LDI r2, 19
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
