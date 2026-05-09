; DESCRIPTION: Creates a purple rectangular region at (110, 88) spanning 19 by 45 pixels.
; PLAN: r0=110(x), r1=88(y), r2=19(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 88
LDI r2, 19
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
