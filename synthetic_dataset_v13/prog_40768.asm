; DESCRIPTION: Creates a purple rectangular region at (354, 36) spanning 31 by 78 pixels.
; PLAN: r0=354(x), r1=36(y), r2=31(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 36
LDI r2, 31
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
