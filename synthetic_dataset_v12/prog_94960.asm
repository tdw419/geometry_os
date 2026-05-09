; DESCRIPTION: Creates a purple rectangular region at (1, 110) spanning 82 by 35 pixels.
; PLAN: r0=1(x), r1=110(y), r2=82(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 110
LDI r2, 82
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
