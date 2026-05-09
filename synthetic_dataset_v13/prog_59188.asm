; DESCRIPTION: Creates a purple rectangular region at (148, 119) spanning 22 by 69 pixels.
; PLAN: r0=148(x), r1=119(y), r2=22(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 22
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
