; DESCRIPTION: Creates a purple rectangular region at (429, 153) spanning 19 by 31 pixels.
; PLAN: r0=429(x), r1=153(y), r2=19(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 153
LDI r2, 19
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
