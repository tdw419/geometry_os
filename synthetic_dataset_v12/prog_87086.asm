; DESCRIPTION: Creates a purple rectangular region at (163, 137) spanning 71 by 82 pixels.
; PLAN: r0=163(x), r1=137(y), r2=71(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 137
LDI r2, 71
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
