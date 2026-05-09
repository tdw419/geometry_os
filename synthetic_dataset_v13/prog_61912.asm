; DESCRIPTION: Creates a purple rectangular region at (177, 7) spanning 76 by 82 pixels.
; PLAN: r0=177(x), r1=7(y), r2=76(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 7
LDI r2, 76
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
