; DESCRIPTION: Creates a purple rectangular region at (141, 203) spanning 82 by 32 pixels.
; PLAN: r0=141(x), r1=203(y), r2=82(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 203
LDI r2, 82
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
