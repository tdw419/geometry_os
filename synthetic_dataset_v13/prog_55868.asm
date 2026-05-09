; DESCRIPTION: Creates a purple rectangular region at (76, 14) spanning 60 by 35 pixels.
; PLAN: r0=76(x), r1=14(y), r2=60(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 14
LDI r2, 60
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
