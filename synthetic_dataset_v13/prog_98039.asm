; DESCRIPTION: Creates a purple rectangular region at (233, 68) spanning 115 by 26 pixels.
; PLAN: r0=233(x), r1=68(y), r2=115(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 68
LDI r2, 115
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
