; DESCRIPTION: Creates a purple rectangular region at (20, 26) spanning 110 by 110 pixels.
; PLAN: r0=20(x), r1=26(y), r2=110(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 26
LDI r2, 110
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
