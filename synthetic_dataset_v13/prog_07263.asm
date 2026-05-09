; DESCRIPTION: Creates a purple rectangular region at (34, 65) spanning 73 by 104 pixels.
; PLAN: r0=34(x), r1=65(y), r2=73(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 65
LDI r2, 73
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
