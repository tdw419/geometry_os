; DESCRIPTION: Creates a purple rectangular region at (29, 26) spanning 100 by 76 pixels.
; PLAN: r0=29(x), r1=26(y), r2=100(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 26
LDI r2, 100
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
