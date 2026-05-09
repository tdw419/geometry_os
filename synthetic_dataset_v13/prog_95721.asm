; DESCRIPTION: Creates a purple rectangular region at (204, 8) spanning 92 by 110 pixels.
; PLAN: r0=204(x), r1=8(y), r2=92(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 8
LDI r2, 92
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
