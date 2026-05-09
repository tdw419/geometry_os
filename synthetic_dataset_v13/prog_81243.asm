; DESCRIPTION: Creates a purple rectangular region at (338, 158) spanning 29 by 11 pixels.
; PLAN: r0=338(x), r1=158(y), r2=29(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 158
LDI r2, 29
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
