; DESCRIPTION: Creates a blue rectangular region at (200, 217) spanning 49 by 36 pixels.
; PLAN: r0=200(x), r1=217(y), r2=49(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 217
LDI r2, 49
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
