; DESCRIPTION: Creates a purple rectangular region at (141, 144) spanning 54 by 110 pixels.
; PLAN: r0=141(x), r1=144(y), r2=54(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 144
LDI r2, 54
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
