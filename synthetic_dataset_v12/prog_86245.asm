; DESCRIPTION: Creates a purple rectangular region at (22, 30) spanning 110 by 56 pixels.
; PLAN: r0=22(x), r1=30(y), r2=110(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 30
LDI r2, 110
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
