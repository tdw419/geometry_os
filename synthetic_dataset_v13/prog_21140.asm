; DESCRIPTION: Creates a purple rectangular region at (332, 139) spanning 26 by 100 pixels.
; PLAN: r0=332(x), r1=139(y), r2=26(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 139
LDI r2, 26
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
