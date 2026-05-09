; DESCRIPTION: Creates a purple rectangular region at (339, 34) spanning 29 by 26 pixels.
; PLAN: r0=339(x), r1=34(y), r2=29(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 34
LDI r2, 29
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
