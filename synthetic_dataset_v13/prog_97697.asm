; DESCRIPTION: Creates a purple rectangular region at (332, 158) spanning 68 by 90 pixels.
; PLAN: r0=332(x), r1=158(y), r2=68(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 158
LDI r2, 68
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
