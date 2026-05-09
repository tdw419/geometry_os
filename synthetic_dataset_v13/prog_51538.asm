; DESCRIPTION: Creates a purple rectangular region at (169, 14) spanning 104 by 88 pixels.
; PLAN: r0=169(x), r1=14(y), r2=104(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 14
LDI r2, 104
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
