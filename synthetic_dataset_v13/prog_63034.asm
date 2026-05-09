; DESCRIPTION: Creates a purple rectangular region at (22, 5) spanning 33 by 69 pixels.
; PLAN: r0=22(x), r1=5(y), r2=33(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 5
LDI r2, 33
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
