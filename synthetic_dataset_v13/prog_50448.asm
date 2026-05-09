; DESCRIPTION: Creates a purple rectangular region at (88, 149) spanning 110 by 96 pixels.
; PLAN: r0=88(x), r1=149(y), r2=110(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 149
LDI r2, 110
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
