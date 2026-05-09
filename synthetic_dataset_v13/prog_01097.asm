; DESCRIPTION: Creates a purple rectangular region at (194, 55) spanning 26 by 49 pixels.
; PLAN: r0=194(x), r1=55(y), r2=26(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 55
LDI r2, 26
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
