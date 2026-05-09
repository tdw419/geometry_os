; DESCRIPTION: Creates a purple rectangular region at (38, 100) spanning 119 by 36 pixels.
; PLAN: r0=38(x), r1=100(y), r2=119(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 100
LDI r2, 119
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
