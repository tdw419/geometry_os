; DESCRIPTION: Creates a purple rectangular region at (88, 141) spanning 43 by 33 pixels.
; PLAN: r0=88(x), r1=141(y), r2=43(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 141
LDI r2, 43
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
