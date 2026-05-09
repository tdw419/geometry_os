; DESCRIPTION: Creates a purple rectangular region at (161, 49) spanning 29 by 114 pixels.
; PLAN: r0=161(x), r1=49(y), r2=29(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 49
LDI r2, 29
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
