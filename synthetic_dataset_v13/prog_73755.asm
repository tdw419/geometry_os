; DESCRIPTION: Creates a purple rectangular region at (141, 118) spanning 100 by 82 pixels.
; PLAN: r0=141(x), r1=118(y), r2=100(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 118
LDI r2, 100
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
