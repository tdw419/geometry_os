; DESCRIPTION: Creates a purple rectangular region at (85, 153) spanning 110 by 10 pixels.
; PLAN: r0=85(x), r1=153(y), r2=110(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 153
LDI r2, 110
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
