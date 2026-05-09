; DESCRIPTION: Creates a purple rectangular region at (322, 36) spanning 78 by 102 pixels.
; PLAN: r0=322(x), r1=36(y), r2=78(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 36
LDI r2, 78
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
