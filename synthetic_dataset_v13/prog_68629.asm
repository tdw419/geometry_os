; DESCRIPTION: Creates a purple rectangular region at (101, 122) spanning 57 by 26 pixels.
; PLAN: r0=101(x), r1=122(y), r2=57(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 122
LDI r2, 57
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
