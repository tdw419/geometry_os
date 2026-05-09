; DESCRIPTION: Creates a purple rectangular region at (218, 69) spanning 22 by 110 pixels.
; PLAN: r0=218(x), r1=69(y), r2=22(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 69
LDI r2, 22
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
